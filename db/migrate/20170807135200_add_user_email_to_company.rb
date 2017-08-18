class AddUserEmailToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :userEmail, :string
  end
end
