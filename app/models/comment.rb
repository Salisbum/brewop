class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe

  validates :user_id, presence: true
  validates :recipe_id, presence: true
  validates :body, presence: true
  validates :body, length: { maximum: 1000 }
end
