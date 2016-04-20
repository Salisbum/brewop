class Recipe < ActiveRecord::Base
  BEER_TYPES = [
    ["IPA", "IPA"],
    ["Hefeweizen", "Hefeweizen"],
    ["Amber Ale", "Amber Ale"],
    ["Saison", "Saison"]
  ]

  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true
  validates :ingredients, presence: true
  validates :ingredients, length: { minimum: 5, maximum: 1000 }
  validates :brewing_instructions, length: { minimum: 5, maximum: 1000 }
  validates :brewing_instructions, presence: true
  validates :description, length: { maximum: 1000 }
end
