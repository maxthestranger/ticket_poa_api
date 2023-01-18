class Category < ApplicationRecord
  has_many :events

  validates :name, presence: true
  validates :cover_image, presence: true
end
