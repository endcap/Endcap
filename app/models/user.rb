class User < ActiveRecord::Base
  acts_as_authentic
  has_many :band_memberships
  has_many :bands, :through => :band_memberships
  has_many :venues
  
  def self.save(upload)
    name =  upload['image'].original_filename
    directory = "public/images/uploads"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['image'].read) }
    
    path[6..path.length]
  end
  
  def full_name
    [self.first_name, self.last_name].join(" ")
  end
  
  def location
    if city.blank? || state.blank?
      city + state
    else
      [city, state].join(", ")
    end
  end
  
  def events
    eventArray = Array.new
    
    self.bands.each do |band|
      band.events.each do |event|
        unless eventArray.include? event
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
        unless albumArray.include? album
          albumArray << album
        end
      end
    end
    
    albumArray[0..number]
  end
  
  def staff?
    return self.editor? || self.superuser?
  end
  
end