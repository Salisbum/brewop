class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.belongs_to :recipe, null: false
      t.belongs_to :ingredient, null: false
      t.belongs_to :user, null: false
      t.string :unit, null: false
      t.integer :quantity, null: false
      t.string :add_point, null: false
      t.string :temperature
    end
  end
end
