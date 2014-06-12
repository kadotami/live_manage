class CreateBigConcerts < ActiveRecord::Migration
  def change
    create_table :big_concerts do |t|
      t.integer :year, :null => false
      t.integer :season, :null => false
      t.boolean :can_edit, default: true

      t.timestamps
    end
  end
end
