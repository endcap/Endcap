class AddStuffToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :description, :text
  end

  def self.down
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :description
  end
end
