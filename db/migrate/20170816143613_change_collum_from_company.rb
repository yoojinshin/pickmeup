class ChangeCollumFromCompany < ActiveRecord::Migration
  def change
    change_column :companies, :companyBirth, :integer
  end
end
