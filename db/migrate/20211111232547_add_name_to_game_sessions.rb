class AddNameToGameSessions < ActiveRecord::Migration[6.0]
  def change
    add_column :game_sessions, :session_name, :string
  end
end
