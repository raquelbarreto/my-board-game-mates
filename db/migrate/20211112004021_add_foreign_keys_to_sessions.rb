class AddForeignKeysToSessions < ActiveRecord::Migration[6.0]
  def change
    add_reference :sessions, :user, null: false, foreign_key: true
    add_reference :sessions, :game, null: false, foreign_key: true
  end
end
