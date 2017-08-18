class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :companyName
      t.integer :request_id
      t.string :content
      t.timestamps null: false
    end
  end
end
