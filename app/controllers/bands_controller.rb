class BandsController < ApplicationController
  
  before_filter :ensure_logged_in, :only => [:new, :create, :update, :destroy]
  
  # GET /bands
  # GET /bands.xml
  def index
    if params[:city] and params[:state]
      @bands = Band.find_all_by_city_and_state(params[:city], params[:state])
    else
      @bands = Band.all
    end

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
      membership = BandMembership.new
      membership.user = User.find_by_id(new_member)
#      params[:band].delete(params[:band][:band_memberships])
      these_band_memberships << membership
      params[:band][:band_memberships] = these_band_memberships
    end
    
    @band = Band.new(params[:band])
    @band.users << current_user
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

        @band.band_memberships << membership
      end
      params[:band][:band_memberships] = @band.band_memberships
      
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
