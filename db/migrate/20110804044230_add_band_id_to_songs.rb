class AddBandIdToSongs < ActiveRecord::Migration
  def self.up
    add_column :songs, :band_id, :integer
  end

  def self.down
    remove_column :songs, :band_id
  end
end
