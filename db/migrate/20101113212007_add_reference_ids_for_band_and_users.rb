class AddReferenceIdsForBandAndUsers < ActiveRecord::Migration
  def self.up
    add_column :bands, :band_membership_id, :integer
    add_column :users, :band_membership_id, :integer
  end

  def self.down
    remove_column :bands, :band_membership_id
    remove_column :users, :band_membership_id
  end
end
