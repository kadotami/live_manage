class CreateBigConcertBands < ActiveRecord::Migration
  def change
    create_table :big_concert_bands do |t|
      t.string :name, :null => false
      t.string :leader, :null => false
      t.string :vo
      t.string :gt1
      t.string :gt2
      t.string :ba
      t.string :dr
      t.string :key
      t.boolean :day1
      t.boolean :day2
      t.boolean :day3
      t.boolean :day4
      t.text :description
      t.integer :year
      t.integer :season

      t.timestamps
    end
  end
end
