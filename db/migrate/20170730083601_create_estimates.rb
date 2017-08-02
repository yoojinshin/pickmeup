class CreateEstimates < ActiveRecord::Migration
  def change
    create_table :estimates do |t|
      t.string :ago
      t.string :userName
      t.string :styleAgo
      t.text :detailAgo
      t.string :back_url
      t.string :front_url
      t.string :damage_url
      t.text :wannaGo

      t.timestamps null: false
    end
  end
end
