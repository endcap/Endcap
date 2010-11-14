class MembershipController < ApplicationController
  def delete
    @band = Band.find_by_id(params[:band])
    puts "found band @band"
    @membership = @band.band_memberships.find_by_id params[:membership]
    
    @band.band_memberships.delete(@membership)
    
    redirect_to(@band, :notice => 'Band member was removed.')
  end
end
