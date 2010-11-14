class AddInstrumentToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :instrument, :string
  end

  def self.down
    remove_column :users, :instrument
  end
end
