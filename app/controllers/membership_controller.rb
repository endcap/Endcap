class MembershipController < ApplicationController
  
  before_filter :ensure_current_user_editor_or_superuser
    
  def delete
    @band = Band.find_by_id(params[:band])
    @membership = @band.band_memberships.find_by_id params[:membership]
    
    @band.band_memberships.delete(@membership)
    
    redirect_to(@band, :notice => 'Band member was removed.')
  end
  
  def create
    band = Band.find(params[:band])
    user = User.find(params[:user])
    membership = BandMembership.new
    membership.band = band
    membership.user = user
    if membership.save
      flash[:notice] = "Member added."
    end
    
    redirect_to root_url
  end
end