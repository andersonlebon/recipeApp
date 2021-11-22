class CreateRecipeFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_foods do |t|
      t.integer :quantity
      t.references :food, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.timestamps
      t.bigint "recipe_id", null: false
      t.index ["recipe_id"], name: "index_recipe_foods_on_recipe_id"
      t.bigint "food_id", null: false
      t.index ["food_id"], name: "index_recipe_foods_on_food_id"
    end
  end
end
