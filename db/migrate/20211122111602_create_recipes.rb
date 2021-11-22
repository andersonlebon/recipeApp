class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :preparation_time
      t.string :cooking_time
      t.text :description
      t.boolean :public, default: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
      t.bigint "user_id", null: false
      t.index ["user_id"], name: "index_recipes_on_user_id"
    end
  end
end
