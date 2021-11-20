class ChangeIsRecurrentToBoolean < ActiveRecord::Migration[6.0]
  def change
    rename_column :game_sessions, :is_recurrent_boolean, :is_recurrent
    change_column :game_sessions, :is_recurrent, 'boolean USING is_recurrent::boolean'
  end
end
