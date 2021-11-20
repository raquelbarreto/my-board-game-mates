class ChangeAgeRatingToString < ActiveRecord::Migration[6.0]
  def change
    change_column :games, :age_rating, :string
  end
end
