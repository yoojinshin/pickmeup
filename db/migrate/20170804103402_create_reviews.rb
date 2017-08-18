class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :reviewType
      t.string :title
      t.string :userEmail
      t.text :content
      t.string :imageURL
      t.integer :hits

      t.timestamps null: false
    end
  end
end
