class Order < ApplicationRecord
  include Filterable

  belongs_to :school
  has_many :items, class_name: 'OrderItem'
  has_many :recipients, through: :items

  accepts_nested_attributes_for :items

  validates :school_id, presence: true
  validate :correct_order_flow, :order_not_shipped, on: :update

  enum status: {
    ORDER_RECEIVED: 1, ORDER_PROCESSING: 2, ORDER_SHIPPED: 3, ORDER_CANCELLED: 4
  }

  def gift_count
    items.map(&:quantity).reduce(:+)
  end

  def recipient_id_list
    items.map(&:recipient_id).uniq
  end

  def recipient_count
    recipient_id_list.count
  end

  private

  def order_not_shipped
    old_status = attribute_in_database('status')
    return unless old_status == 'ORDER_SHIPPED'

    errors.add('Status:', "Can't modify order in #{old_status} status")
  end

  def correct_order_flow
    old_status = Order.statuses[attribute_in_database('status')]
    new_status = Order.statuses[status]
    return if ORDER_CANCELLED? || new_status == old_status + 1 || new_status == old_status

    errors.add('Status:',
               'Must follow proper flow: Received->Processing->Shipped unless Cancelled')
  end
end
