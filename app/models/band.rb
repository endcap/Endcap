class Band < ActiveRecord::Base
  has_many :band_memberships
  has_many :users, :through => :band_memberships
  has_many :band_events
  has_many :events, :through => :band_events
  has_many :albums
  
  validates :name, :presence => true
  
  def location
    [self.city, self.state].join(", ")
  end
  
  def self.save(upload)
    name =  upload['image'].original_filename
    logger.info "**** name = #{name}"
    directory = "public/images/uploads"
    # create the file path
    path = File.join(directory, name)

    File.open(path, "wb") { |f| f.write(upload['image'].read) }
    
    path[6..path.length]
  end
end
