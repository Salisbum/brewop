class Ingredient < ActiveRecord::Base
  UNITS = [
    ["LBS", "LBS"],
    ["TSP", "TSP"],
    ["GAL", "GAL"],
    ["OZ", "OZ"],
    ["PACKAGE", "PACKAGE"]
  ]

  belongs_to :recipe
  belongs_to :user
  has_many :instructions, dependent: :destroy

  validates :recipe_id, presence: true
  validates :user_id, presence: true
  validates :unit, presence: true
  validates :quantity, presence: true, numericality: true
  validates :item, presence: true
end
