class CreateInventoryFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :inventory_foods do |t|
      t.integer :quantity
      t.references :food, null: false, foreign_key: true
      t.references :inventory, null: false, foreign_key: true
      t.timestamps
      t.bigint "inventory_id", null: false
      t.index ["inventory_id"], name: "index_inventory_foods_on_inventory_id"
      t.bigint "food_id", null: false
      t.index ["food_id"], name: "index_inventory_foods_on_food_id"
    end
  end
end
