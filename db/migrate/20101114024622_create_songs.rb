class CreateSongs < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
      t.integer :album_id
      t.string :name
      t.integer :number

      t.timestamps
    end
  end

  def self.down
    drop_table :songs
  end
end
