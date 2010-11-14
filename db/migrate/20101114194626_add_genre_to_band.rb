class AddGenreToBand < ActiveRecord::Migration
  def self.up
		add_column :bands, :genre, :string
	end

  def self.down
		remove_column :bands, :genre
  end
end
