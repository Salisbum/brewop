class Batch < ActiveRecord::Base
  BOTTLING_OPTIONS = [
    ["7OZ", "7OZ"],
    ["12OZ", "12OZ"],
    ["16OZ", "16OZ"],
    ["22OZ", "22OZ"],
    ["1L", "1L"],
    ["2L", "2L"],
    ["KEG", "KEG"]
  ]

  belongs_to :recipe
  belongs_to :user

  validates :recipe_id, presence: true
  validates :user_id, presence: true
  validates :bottle_count, presence: true, numericality: { less_than_or_equal_to: 200 }
  validates :bottle_brewed, presence: true, numericality: { less_than_or_equal_to: 200 }
  validates :batch_name, presence: true
  validates :batch_notes, presence: true, length: { maximum: 500 }
  validates :bottling_option, presence: true
end
