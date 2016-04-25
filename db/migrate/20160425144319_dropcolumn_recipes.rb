class DropcolumnRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :brewing_instructions
    remove_column :recipes, :ingredients
  end
end
