class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :displayed_name, presence: true
end
