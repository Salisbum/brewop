class Instruction < ActiveRecord::Base
  UNITS = [
    ["LBS", "LBS"],
    ["TSP", "TSP"],
    ["GAL", "GAL"],
    ["OZ", "OZ"],
    ["PACKAGE", "PACKAGE"]
  ]

  belongs_to :recipe
  belongs_to :user
  belongs_to :ingredient

  validates :recipe_id, presence: true
  validates :user_id, presence: true
  validates :ingredient_id, presence: true
  validates :unit, presence: true
  validates :quantity, presence: true, numericality: true
  validates :add_point, presence: true
end
