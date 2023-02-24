class List < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :bookmarks
  has_many :movies, through: :bookmarks, dependent: :destroy

end
