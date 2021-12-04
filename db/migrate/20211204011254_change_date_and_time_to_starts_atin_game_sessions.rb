class ChangeDateAndTimeToStartsAtinGameSessions < ActiveRecord::Migration[6.0]
  def change
    rename_column :game_sessions, :date_and_time, :starts_at
  end
end
