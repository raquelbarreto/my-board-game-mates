class AddDatetimeToGameSesssions < ActiveRecord::Migration[6.0]
  def change
    add_column :game_sessions, :date_and_time, :datetime
  end
end
