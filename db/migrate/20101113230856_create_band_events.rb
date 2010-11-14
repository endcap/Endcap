class CreateBandEvents < ActiveRecord::Migration
  def self.up
    create_table :band_events do |t|
      t.date :date
      t.integer :order
      t.string :time

      t.timestamps
    end
  end

  def self.down
    drop_table :band_events
  end
end
