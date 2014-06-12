class CreateSmallConcertBands < ActiveRecord::Migration
  def change
    create_table :small_concert_bands do |t|
      t.string :name, :null => false
      t.string :song, :null => false
      t.string :leader, :null => false
      t.string :vo
      t.string :gt1
      t.string :gt2
      t.string :ba
      t.string :dr
      t.string :key
      t.boolean :week1
      t.boolean :week2
      t.text :description
      t.integer :year
      t.integer :month

      t.timestamps
    end
  end
end
