class Category < ApplicationRecord
  has_many :events

  validates :name, presence: true
  validates :cover_image, presence: true
  validates :event_count, presence: false, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
