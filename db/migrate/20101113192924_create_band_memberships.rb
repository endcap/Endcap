class CreateBandMemberships < ActiveRecord::Migration
  def self.up
    create_table :band_memberships do |t|
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end

  def self.down
    drop_table :band_memberships
  end
end
