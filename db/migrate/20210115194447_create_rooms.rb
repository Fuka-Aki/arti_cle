class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string  :artist_name, null: false
      t.integer :genre_id, null: false
      t.timestamps
    end
  end
end