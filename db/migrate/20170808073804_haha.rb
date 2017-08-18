class Haha < ActiveRecord::Migration
  def change
    change_column :users, :birth, :integer
    change_column :users, :address, :text
  end
end
