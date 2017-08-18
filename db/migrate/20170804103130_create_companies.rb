class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :companyName
      t.string :companyPhone
      t.string :companyNum
      t.string :imageURL
      t.string :menuURL
      t.string :storeURL
      t.integer :numStaff
      t.date :companyBirth
      t.text :companyAddress

      t.timestamps null: false
    end
  end
end
