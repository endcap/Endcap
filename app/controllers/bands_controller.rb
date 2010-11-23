class BandsController < ApplicationController
  
  # GET /bands
  # GET /bands.xml
  def index
    where_hash = {}
    where_hash[:state] = params[:state] if params[:state]
    where_hash[:city] = params[:city] if params[:city]
    where_hash[:genre] = params[:genre] if params[:genre]
    
    @bands = Band.where(where_hash)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bands }
    end
  end

  # GET /bands/1
  # GET /bands/1.xml
  def show
    @band = Band.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @band }
    end
  end

  # GET /bands/new
  # GET /bands/new.xml
  def new
    @band = Band.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @band }
    end
  end

  # GET /bands/1/edit
  def edit
    @band = Band.find(params[:id])
  end

  # POST /bands
  # POST /bands.xml
  def create
    
    new_member = params[:band][:band_memberships]
    these_band_memberships = Array.new
    
    if new_member.length > 0
      logger.info 'Adding new member'
      membership = BandMembership.new
      membership.user = User.find_by_id(new_member)
      if params[:from_date]
        membership.start_date = Date.civil(params[:from_date].to_i, 1, 1);
      end
      if params[:to_date]
        membership.end_date = Date.civil(params[:to_date].to_i, 1, 1);
      end
        
#      params[:band].delete(params[:band][:band_memberships])
      these_band_memberships << membership
      params[:band][:band_memberships] = these_band_memberships
    else
      logger.info "removing band_memberships from the band"
      params[:band].delete(:band_memberships)
    end
    
    if (params[:band][:image])
      params[:band][:image] = User.save(params[:band])
      logger.info "set params[:band][:image] to #{params[:band][:image]}"
    else
      logger.info "removing image from parameters"
      params[:band].delete(params[:band][:image])
    end
    
    logger.info "creating band"
    @band = Band.new(params[:band])
    logger.info "created band"
    @band.users << current_user
    logger.info "added user"
    
    respond_to do |format|
      
      if @band.save
        format.html { redirect_to(@band, :notice => 'Band was successfully created.') }
        format.xml  { render :xml => @band, :status => :created, :location => @band }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @band.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bands/1
  # PUT /bands/1.xml
  def update
    @band = Band.find(params[:id])

    respond_to do |format|
      new_member = params[:band][:band_memberships]

      if new_member.length > 0
        membership = BandMembership.new
        membership.user = User.find_by_id(new_member)
        membership.band = @band

        if params[:from_date]
          membership.start_date = Date.civil(params[:from_date].to_i, 1, 1);
        else
          logger.info "Could not find from date. What about this? #{params['from_date']}"
        end
        if params[:to_date]
          membership.end_date = Date.civil(params[:to_date].to_i, 1, 1);
        end

        @band.band_memberships << membership
      end
      params[:band][:band_memberships] = @band.band_memberships
      
      if (params[:band][:image])
        params[:band][:image] = User.save(params[:band])
        logger.info "set params[:band][:image] to #{params[:band][:image]}"
      end
      
      if @band.update_attributes(params[:band])
        format.html { redirect_to(@band, :notice => 'Band was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @band.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bands/1
  # DELETE /bands/1.xml
  def destroy
    @band = Band.find(params[:id])
    @band.destroy

    respond_to do |format|
      format.html { redirect_to(bands_url) }
      format.xml  { head :ok }
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
