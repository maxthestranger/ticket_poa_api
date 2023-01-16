class Event < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :venue_url, presence: true, length: { maximum: 50 }
  validates :venue_name, presence: true, length: { maximum: 50 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :poster, presence: true
  validates :category_id, presence: true
  validates :user_id, presence: true
  validates :video_url, presence: true, length: { maximum: 50 }
  validates :live, presence: true, inclusion: { in: [true, false] }
  validates :type, presence: true, inclusion: { in: %w[online offline] }
end
