class AddStyleUrLsToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :styleURL, :string
  end
end
