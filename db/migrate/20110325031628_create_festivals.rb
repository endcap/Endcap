class CreateFestivals < ActiveRecord::Migration
  def self.up
    create_table :festivals do |t|
      t.string :name
      t.text :description
      t.string :image
      t.date :start_date
      t.date :end_date
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :festivals
  end
end
