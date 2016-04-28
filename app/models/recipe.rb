class Recipe < ActiveRecord::Base
  BEER_TYPES = [
    ["IPA", "IPA"],
    ["Hefeweizen", "Hefeweizen"],
    ["Amber Ale", "Amber Ale"],
    ["Saison", "Saison"],
    ["Bitter", "Bitter"],
    ["Pale Ale", "Pale Ale"],
    ["Stout", "Stout"],
    ["Porter", "Porter"],
    ["Pilsner", "Pilsner"],
    ["Cider", "Cider"],
    ["Lambic", "Lambic"]
  ]

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :instructions, dependent: :destroy
  has_many :batches, dependent: :destroy

  validates :user_id, presence: true
  validates :name, presence: true
  validates :description, length: { maximum: 1000 }
end
