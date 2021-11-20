class AddTitleToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :game_reviews, :title, :string
    add_column :user_reviews, :title, :string
  end
end
