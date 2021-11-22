class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurement_unit
      t.decimal :price
      t.references :user, null: false, foreign_key: true
      t.timestamps
      t.bigint "user_id", null: false
      t.index ["user_id"], name: "index_foods_on_user_id"
    end
  end
end
