class List < ApplicationRecord
  has_many :movies, dependent: :destroy # FIRST should destroy child saved movies when destroying self
  has_many :bookmarks # ! SECOND ! first, list has many bookmaks
  has_many :movies, through: 'bookmarks'  # ! THIRD ! and than list has many movies through bookmarks

  validates :name, presence: true, uniqueness: true
end
