class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.belongs_to :recipe, null: false
      t.belongs_to :user, null: false
      t.string :unit, null: false
      t.integer :quantity, null: false
      t.string :item, null: false
    end
  end
end
