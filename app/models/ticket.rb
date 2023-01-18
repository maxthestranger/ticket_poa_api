class Ticket < ApplicationRecord
  belongs_to :event

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :event_id, presence: true

  def sold_out?
    self.sold_out
  end
end
