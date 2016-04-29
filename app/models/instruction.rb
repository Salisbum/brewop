class Instruction < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user
  belongs_to :ingredient

  validates :recipe_id, presence: true
  validates :user_id, presence: true
  validates :ingredient_id, presence: true
  validates :unit, presence: true
  validates :quantity, presence: true
  validates :add_point, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 60 }
  validates :details, length: { maximum: 500 }
end
