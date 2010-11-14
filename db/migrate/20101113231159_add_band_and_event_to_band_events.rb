class AddBandAndEventToBandEvents < ActiveRecord::Migration
  def self.up
    add_column :band_events, :band_id, :integer
    add_column :band_events, :event_id, :integer
  end

  def self.down
    remove_column :band_events, :band_id
    remove_column :band_events, :event_id
  end
end
