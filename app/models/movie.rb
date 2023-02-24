class Movie < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  validates :overview, presence: true
  has_many :bookmarks
  has_one_attached :photo
end
