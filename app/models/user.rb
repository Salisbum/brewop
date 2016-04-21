class User < ActiveRecord::Base
  has_many :recipes
  has_many :comments
  has_one :profile

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
