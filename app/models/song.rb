class Song < ActiveRecord::Base
  belongs_to :album
  belongs_to :band

  def self.save(upload)
    name =  upload['mp3'].original_filename
    directory = "public/mp3"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['mp3'].read) }
    
    name
  end
  
end
