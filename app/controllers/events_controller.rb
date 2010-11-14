class EventsController < ApplicationController
  
  # GET /events
  # GET /events.xml
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.xml
  def create
    
    new_band = params[:event][:band_events]
    these_event_bands = Array.new
    
    if new_band.length > 0
      added_band = BandEvent.new
      added_band.band = Band.find_by_id(new_band)
      these_event_bands << added_band
      params[:event][:band_events] = these_event_bands
    end
    
    new_venue = params[:event][:venue_id]
    this_venue = String.new
    
    if new_venue.length > 0
      added_venue = Venue.new
      added_venue = Venue.find_by_id(new_venue)
      this_venue = added_venue
      params[:event][:venue] = this_venue
    end    
    
    
       
   @event = Event.new(params[:event]) 
    
    respond_to do |format|
      if @event.save
        format.html { redirect_to(@event, :notice => 'Event was successfully created.') }
        format.xml { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      new_band = params[:event][:band_events]

      
      if new_band.length > 0
        added_band = BandEvent.new
        added_band.band = Band.find_by_id(new_band)
        added_band.event = @event
        
        @event.band_events << added_band
      end
      params[:event][:band_events] = @event.band_events
      
      
      new_venue = params[:event][:venue_id]

      if new_venue.length > 0
        added_venue = Venue.new
        added_venue = Venue.find_by_id(new_venue)
        
        @event.venue = added_venue
        
      end
      params[:event][:venue] = @event.venue
      
      
      if @event.update_attributes(params[:event])
        format.html { redirect_to(@event, :notice => 'Event was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml { head :ok }
    end
  end
  
  private
  
  def ensure_logged_in
    if current_user
      return true
    else
      redirect_to root_url
      return false
    end
  end
end

