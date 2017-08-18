class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :userType
      t.string :email
      t.string :password_digest
      t.string :userName
      t.string :phoneNum
      t.date :birth
      t.string :gender
      t.string :address

      t.timestamps null: false
    end
  end
end
