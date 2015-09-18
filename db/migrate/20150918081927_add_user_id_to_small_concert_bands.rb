class AddUserIdToSmallConcertBands < ActiveRecord::Migration
  def change
    add_column :small_concert_bands, :user_id, :integer
  end
end
