class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :userType
      t.string :email
      t.string :password_digest
      t.string :userName
      t.string :phoneNum
      t.integer :birth
      t.string :gender
      t.text :address

      t.timestamps null: false
    end
    
    add_index :users, :email, unique: true
  end
end
