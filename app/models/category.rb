class Category < ApplicationRecord
  has_many :events, dependent: :destroy

  validates :name, presence: true
  validates :cover_image, presence: true
end
