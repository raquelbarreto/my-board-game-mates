class CreateLobbies < ActiveRecord::Migration[6.0]
  def change
    create_table :lobbies do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game_session, null: false, foreign_key: true
      t.boolean :available

      t.timestamps
    end
  end
end
