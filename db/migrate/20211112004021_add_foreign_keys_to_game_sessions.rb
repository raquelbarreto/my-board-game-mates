class AddForeignKeysToGameSessions < ActiveRecord::Migration[6.0]
  def change
    add_reference :game_sessions, :user, null: false, foreign_key: true
    add_reference :game_sessions, :game, null: false, foreign_key: true
  end
end
