class Movie < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :users, through: :favorites
  accepts_nested_attributes_for :favorites

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  with_options presence: true do
    validates :title
    validates :text
    validates :url
    validates :time
  end
end
