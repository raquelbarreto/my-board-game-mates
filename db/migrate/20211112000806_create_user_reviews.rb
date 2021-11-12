class CreateUserReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :user_reviews do |t|
      t.references :recepient, null: false
      t.references :author, null: false
      t.integer :rating
      t.text :content

      t.timestamps
    end
  end
end
