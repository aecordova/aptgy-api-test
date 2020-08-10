class School < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  has_many :recipients
  has_many :orders
  has_many :order_items, through: :orders

  def orders_on date 
    orders.where(date: date) 
  end

  def ordered_gifts_on date
    orders_on_date(date).map { |order| order.item_count }.reduce(:+)
  end
end
