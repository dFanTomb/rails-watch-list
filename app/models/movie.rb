class Movie < ApplicationRecord

  has_many :bookmarks
  # has_many :bookmarks, before_remove: :check_movies

  validates :title, :overview, presence: true, uniqueness: true
end
