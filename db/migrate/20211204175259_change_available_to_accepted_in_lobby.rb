class ChangeAvailableToAcceptedInLobby < ActiveRecord::Migration[6.0]
  def change
    rename_column :lobbies, :available, :accepted
  end
end
