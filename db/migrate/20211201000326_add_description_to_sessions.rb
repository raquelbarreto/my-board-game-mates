class AddDescriptionToSessions < ActiveRecord::Migration[6.0]
  def change
    add_column :game_sessions, :description, :text
  end
end
