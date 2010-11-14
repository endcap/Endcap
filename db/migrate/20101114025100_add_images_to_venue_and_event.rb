class AddImagesToVenueAndEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :image, :string
    add_column :venues, :image, :string
  end

  def self.down
    remove_column :events, :image, :string
    remove_column :venues, :image, :string    
  end
end
