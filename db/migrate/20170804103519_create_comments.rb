class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.string :userEmail
      t.integer :review_id

      t.timestamps null: false
    end
  end
end
