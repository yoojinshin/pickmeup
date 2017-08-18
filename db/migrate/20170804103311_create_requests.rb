class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.boolean :ago
      t.string :userEmail
      t.string :styleAgo
      t.text :detailAgo
      t.string :backURL
      t.string :frontURL
      t.string :damageURL
      t.string :style
      t.text :detail
      t.text :wannaGo

      t.timestamps null: false
    end
  end
end
