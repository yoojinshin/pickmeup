class AddCompanyUrlToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :companyURL, :string
  end
end
