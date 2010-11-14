class AddUserToVenue < ActiveRecord::Migration
  def self.up
    remove_column :venues, :user_id, :integer
  end

  def self.down
    add_column :venues, :user_id
  end
end
