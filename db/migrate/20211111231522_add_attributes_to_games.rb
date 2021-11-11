class AddAttributesToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :name, :string
    add_column :games, :description, :text
    add_column :games, :age_rating, :integer
    add_column :games, :player_count, :string
    add_column :games, :category, :string
    add_column :games, :duration, :integer
  end
end
