class CreateGameReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :game_reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.integer :rating
      t.text :content

      t.timestamps
    end
  end
end
