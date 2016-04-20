class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.belongs_to :user, null: false
      t.string :name, null: false
      t.string :beer_type
      t.text :ingredients, null: false
      t.text :brewing_instructions, null: false
      t.text :description
      t.timestamps null: false
    end
  end
end
