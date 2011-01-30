class MembershipController < ApplicationController
  
  before_filter :ensure_current_user_editor_or_superuser
    
  def delete
    @band = Band.find_by_id(params[:band])
    @membership = @band.band_memberships.find_by_id params[:membership]
    
    @band.band_memberships.delete(@membership)
    
    render 'delete', :layout => false
  end
  
  def create
    band = Band.find(params[:band])
    if params[:user].to_i == -1 and !params[:name].blank?
      names = params[:name].split(' ')
      first_name = names[0]
      last_name = names[names.length-1] || ""
      user = User.new
      id = User.maximum('id')+1
      user.first_name = first_name
      user.last_name = last_name
      user.email = "user#{id}@endcap.info"
      user.password = "user#{id}isnotarealperson"
      user.password_confirmation = "user#{id}isnotarealperson"
      user.can_login = false
      user.save
    else
      user = User.find(params[:user])
    end
    @membership = BandMembership.new
    @membership.band = band
    @membership.user = user
    if @membership.save
      flash[:notice] = "Member added."
    end
    
    render 'create', :layout => false
  end
end