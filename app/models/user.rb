class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  has_many :movies       
  has_many :favorites
  has_many :favorite_movies, through: :favorites, source: :movie

  with_options presence: true do
  validates :nickname
  validates :email, uniqueness: {case_sensitive: true},
  format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates :password
  validates :password_confirmation
  end
end
