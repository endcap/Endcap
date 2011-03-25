class AddFestivalIdToSponsor < ActiveRecord::Migration
  def self.up
    add_column :sponsors, :festival_id, :integer
  end

  def self.down
    remove_column :sponsors, :festival_id
  end
end
