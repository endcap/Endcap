class BandEventController < ApplicationController
  def delete
    @event = Event.find_by_id(params[:event])
    @events = @event.band_events
    @band = @event.band_events.find_by_id params[:band]
    
    @event.band_events.delete(@band)
    
    redirect_to(@event, :notice => 'Band member was removed.')
  end
end