class AddFieldsToVenues < ActiveRecord::Migration
  def self.up
    add_column :venues, :city, :string
    add_column :venues, :state, :string
    add_column :venues, :homepage, :text
  end

  def self.down
    remove_column :venues, :city
    remove_column :venues, :state
    remove_column :venues, :homepage
  end
end
