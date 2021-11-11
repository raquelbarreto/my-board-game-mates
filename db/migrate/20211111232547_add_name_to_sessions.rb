class AddNameToSessions < ActiveRecord::Migration[6.0]
  def change
    add_column :sessions, :session_name, :string
  end
end
