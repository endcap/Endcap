class Album < ActiveRecord::Base
  belongs_to :band
  has_many :users
  has_many :songs
  
  def self.save(upload)
    logger.info "**** upload['image'] = #{upload['image']}"
    name =  upload['image'].original_filename
    logger.info "**** name = #{name}"
    directory = "public/images/uploads"
    # create the file path
    path = File.join(directory, name)
    logger.info "**** path = #{path}"
    # write the file
    File.open(path, "wb") { |f| f.write(upload['image'].read) }
    
    path[6..path.length]
  end

  def image
    self.read_attribute(:image) || default_image_location
  end

  def default_image_location
    "/images/defaults/default_album_image.jpg"
  end
end