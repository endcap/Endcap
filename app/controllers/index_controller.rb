class IndexController < ApplicationController

  def index
    @bands = Band.last(5)
    @users = User.last(5)
    @venues = Venue.last(5)

    respond_to do |format|
      format.html # index.html.erb
      #format.xml  { render :xml => @bands }
    end
  end
  
end
