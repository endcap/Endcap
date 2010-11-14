class User < ActiveRecord::Base
  acts_as_authentic
  has_many :band_memberships
  has_many :bands, :through => :band_memberships
  has_many :venues
  
  def full_name
    [self.first_name, self.last_name].join(" ")
  end
  
  def location
    [self.city, self.state].join(", ")
  end
  
  def events
    eventArray = Array.new
    
    self.bands.each do |band|
      band.events.each do |event|
        if !eventArray.include? event
          eventArray << event
        end
        logger.info "added event named #{event.name}"
      end
    end
    
    eventArray
  end
  
  def albums(number=2)
    # call with number of albums you want, but we start counting at 0
    if number > 0
      number = number-1
    end
    albumArray = Array.new
    
    self.bands.each do |band|
      band.albums.each do |album|
        if !albumArray.include? album
          albumArray << album
        end
      end
    end
    
    albumArray[0..number]
  end
  
end
