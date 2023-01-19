class Event < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :tickets, dependent: :destroy
  has_many :orders, dependent: :destroy

  after_create :increase_category_event_count
  after_destroy :decrease_category_event_count

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

  def self.search(search)
    where('title ILIKE ?', "%#{search}%")
  end

  def self.filter_by_category(category)
    where(category_id: category)
  end

  def self.filter_by_type(type)
    where(type: type)
  end

  def self.filter_by_date(date)
    where('start_date >= ?', date)
  end

  def self.filter_by_price(price)
    where('price <= ?', price)
  end

  def self.filter_by_live(live)
    where(live: live)
  end

  private

  def increase_category_event_count(category_id)
    category = Category.find(category_id)
    category.event_count += 1
    category.save
  end

  def decrease_category_event_count(category_id)
    category = Category.find(category_id)
    category.event_count -= 1
    category.save
  end
end