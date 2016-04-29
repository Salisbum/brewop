class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.belongs_to :recipe, null: false
      t.belongs_to :ingredient
      t.belongs_to :user, null: false
      t.string :unit, null: false
      t.float :quantity, null: false
      t.integer :add_point, null: false
      t.string :temperature
      t.string :details
    end
  end
end
