class AddCompanyIntroToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :companyIntro, :string
  end
end
