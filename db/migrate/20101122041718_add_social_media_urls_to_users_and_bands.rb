class AddSocialMediaUrlsToUsersAndBands < ActiveRecord::Migration
  def self.up
    add_column :bands, :twitter, :string
    add_column :bands, :facebook, :string
    add_column :bands, :myspace, :string
    add_column :users, :twitter, :string
    add_column :users, :facebook, :string
    add_column :users, :myspace, :string
    
  end

  def self.down
    remove_column :bands, :twitter
    remove_column :bands, :facebook
    remove_column :bands, :myspace
    remove_column :users, :twitter
    remove_column :users, :facebook
    remove_column :users, :myspace
    
  end
end
