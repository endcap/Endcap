class CreateEvent < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.string :time
      t.string :cost
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
