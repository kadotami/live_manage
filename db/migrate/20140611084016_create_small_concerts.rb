class CreateSmallConcerts < ActiveRecord::Migration
  def change
    create_table :small_concerts do |t|
      t.integer :year, :null => false
      t.integer :month, :null => false
      t.boolean :can_edit, default: true

      t.timestamps
    end
    add_index :small_concerts, [:year, :month], :unique => true
  end
end
