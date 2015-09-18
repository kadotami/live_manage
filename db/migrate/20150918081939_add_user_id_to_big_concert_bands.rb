class AddUserIdToBigConcertBands < ActiveRecord::Migration
  def change
    add_column :big_concert_bands, :user_id, :integer
  end
end
