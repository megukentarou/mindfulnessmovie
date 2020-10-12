class Movie < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :text
    validates :url
    validates :time
  end
end
