class CreateHairshopLists < ActiveRecord::Migration
  def change
    create_table :hairshop_lists do |t|
      t.string :email
      t.string :userName
      t.integer :birth
      t.text :address

      t.timestamps null: false
    end
    
    add_index :hairshop_lists, :email, unique: true
  end
end
