class AddLabelToAlbum < ActiveRecord::Migration
  def self.up
		add_column :albums, :label, :string
	end

  def self.down
		remove_column :album, :label
  end
end
