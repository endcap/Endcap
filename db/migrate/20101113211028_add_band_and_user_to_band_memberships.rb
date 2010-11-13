class AddBandAndUserToBandMemberships < ActiveRecord::Migration
  def self.up
    add_column :band_memberships, :user_id, :integer
    add_column :band_memberships, :band_id, :integer
  end

  def self.down
    remove_column :band_memberships, :user_id
    remove_column :band_memberships, :band_id
  end
end
