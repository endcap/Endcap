class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.string :name
      t.integer :band_id
      t.string :year
      t.text :description
      t.string :image

      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end
