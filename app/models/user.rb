class User < ActiveRecord::Base
  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :instructions, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :build_default_profile

  def admin?
  role == "admin"
  end

  private

  def build_default_profile
    build_profile
    true
  end
end
