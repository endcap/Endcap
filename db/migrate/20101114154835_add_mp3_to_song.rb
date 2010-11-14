class AddMp3ToSong < ActiveRecord::Migration
  def self.up
		add_column :songs, :mp3, :string
  end

  def self.down
		drop_column :songs, :mp3
  end
end
