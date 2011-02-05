class AddCanLoginToUsers < ActiveRecord::Migration
  def self.up
		add_column :users, :can_login, :boolean, :default => true
  end

  def self.down
		remove_column :users, :can_login
  end
end
