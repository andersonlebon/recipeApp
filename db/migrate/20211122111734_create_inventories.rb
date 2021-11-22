class CreateInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.timestamps
      t.bigint "user_id", null: false
      t.index ["user_id"], name: "index_inventories_on_user_id"
    end
  end
end
