class Order < ApplicationRecord
  belongs_to :school
  has_many :order_details

  validates :school_id, presence: true
  accepts_nested_attributes_for :order_details

  include Filterable

  enum status: {
    ORDER_RECEIVED: 1, ORDER_PROCESSING: 2, ORDER_SHIPPED: 3, ORDER_CANCELLED: 4
  }, _default: 'ORDER_RECEIVED'
end
