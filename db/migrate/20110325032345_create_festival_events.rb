class CreateFestivalEvents < ActiveRecord::Migration
  def self.up
    create_table :festival_events do |t|
      t.references :festival
      t.references :event

      t.timestamps
    end
  end

  def self.down
    drop_table :festival_events
  end
end
