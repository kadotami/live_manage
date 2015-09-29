class CreateBigConcerts < ActiveRecord::Migration
  def change
    create_table :big_concerts do |t|
      t.integer :year, :null => false
      t.integer :season, :null => false
      t.boolean :can_edit, default: true

      t.timestamps
    end
    add_index :big_concerts, [:year, :season], :unique => true
  end
end
