class CreateGameSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :game_sessions do |t|
      t.date :date
      t.time :time
      t.string :address
      t.float :latitute
      t.float :longitude
      t.boolean :is_smoke_free, null: false
      t.boolean :is_family_friendly, null: false
      t.boolean :has_drinks, null: false
      t.boolean :has_food, null: false
      t.integer :capacity
      t.string :is_recurrent

      t.timestamps
    end
  end
end
