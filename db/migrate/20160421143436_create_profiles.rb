class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user, null: false
      t.string :username, null: false, default: ""
      t.string :avatar_url
      t.string :location
      t.text :brewop_name
      t.timestamps null: false
    end
  end
end
