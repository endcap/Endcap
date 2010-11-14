class AddImageToBands < ActiveRecord::Migration
  def self.up
    add_column :bands, :image, :string
  end

  def self.down
    remove_column :bands, :image
  end
end
