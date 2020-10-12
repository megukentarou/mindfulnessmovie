class Movie < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :text
    validates :url
    validates :time
  end
end
