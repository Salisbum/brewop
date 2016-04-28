class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string :bottling_option, null: false
      t.timestamps null: false
      t.belongs_to :recipe, null: false
      t.belongs_to :user, null: false
      t.integer :bottle_count, null: false
      t.integer :bottle_brewed, null: false
      t.string :batch_name, null: false
      t.text :batch_notes, null: false
    end
  end
end
