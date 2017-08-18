class CreateReserves < ActiveRecord::Migration
  def change
    create_table :reserves do |t|
      t.string :customerEmail
      t.string :companyEmail
      t.string :type
      t.integer :response

      t.timestamps null: false
    end
  end
end
