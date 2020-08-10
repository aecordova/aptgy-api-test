class Order < ApplicationRecord
  include Filterable

  # before_save :verify_order_not_shipped

  belongs_to :school
  has_many :items, class_name: 'OrderItem'
  has_many :recipients, through: :items

  accepts_nested_attributes_for :items

  validates :school_id, presence: true
  validate :within_daily_gift_limit, :within_recipient_limit
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

  def within_daily_gift_limit
    return unless school.ordered_gifts_on date + gift_count > MAX_ITEMS_PER_DAY

    errors.add('Gift Count:', "Daily gift limit exceeded, Max: #{MAX_ITEMS_PER_DAY}")
  end

  def within_recipient_limit
    return unless recipient_count > MAX_RECIPIENTS_PER_ORDER

    errors.add('Recipient Count:',
               "Recipient limit exceeded, Max: #{MAX_RECIPIENTS_PER_ORDER}")
  end

  def order_not_shipped
    old_status = attribute_in_database('status')
    return unless old_status == 'ORDER_SHIPPED'

    errors.add('Status:', "-Can't modify order in #{old_status} status")
  end

  def correct_order_flow
    old_status = Order.statuses[attribute_in_database('status')]
    new_status = Order.statuses[status]
    if ORDER_CANCELLED? || new_status == old_status + 1 || new_status == old_status
      return
    end

    errors.add('Status:',
               'Must follow proper flow: Received->Processing->Shipped unless Cancelled')
  end
end
