class CreateBands < ActiveRecord::Migration
  def self.up
    create_table :bands do |t|
      t.string :name
      t.string :start_year
      t.string :end_year
      t.string :city
      t.string :state
      t.text :description
      t.string :homepage
      t.string :store_url

      t.timestamps
    end
  end

  def self.down
    drop_table :bands
  end
end
