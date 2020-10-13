class Movie < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :users, through: :favorites
  accepts_nested_attributes_for :favorites

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  with_options presence: true do
    validates :title, length: { maximum: 100,
      too_long: "最大%{count}文字まで使えます" }
    validates :text, length: { maximum: 1000,
      too_long: "最大%{count}文字まで使えます" }
    validates :url, length: { is: 6 }
    validates :time, numericality: { only_integer: true }
  end
end
