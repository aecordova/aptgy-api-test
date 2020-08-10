class Order < ApplicationRecord
  include Filterable
  
  belongs_to :school
  has_many :items, class_name: 'OrderItem'
  has_many :recipients, through: :items
  
  accepts_nested_attributes_for :items

  validates :school_id, presence: true
  validate :is_within_daily_gift_limit, :is_within_recipient_limit

  enum status: {
    ORDER_RECEIVED: 1, ORDER_PROCESSING: 2, ORDER_SHIPPED: 3, ORDER_CANCELLED: 4
  }

  def gift_count
    items.map { |i| i.quantity }.reduce(:+)
  end

  def recipient_id_list
    items.map { |i| i.recipient_id }.uniq
  end

  def recipient_count
    recipient_id_list.count
  end

  private

  def is_within_daily_gift_limit
     return unless school.ordered_gifts_on self.date + self.gift_count > MAX_ITEMS_PER_DAY
        
     errors.add(:gift_count, "Daily gift limit exceeded, Max: #{MAX_ITEMS_PER_DAY}")
  end

  def is_within_recipient_limit
    return unless recipient_count > MAX_RECIPIENTS_PER_ORDER
      
    errors.add(:order_items, "Recipient limit exceeded, Max: #{MAX_RECIPIENTS}")
  end
end
