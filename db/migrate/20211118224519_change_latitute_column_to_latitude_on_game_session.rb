class ChangeLatituteColumnToLatitudeOnGameSession < ActiveRecord::Migration[6.0]
  def change
    rename_column :game_sessions, :latitute, :latitude
  end
end
