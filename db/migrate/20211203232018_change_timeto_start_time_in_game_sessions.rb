class ChangeTimetoStartTimeInGameSessions < ActiveRecord::Migration[6.0]
  def change
    rename_column :game_sessions, :time, :start_time
  end
end
