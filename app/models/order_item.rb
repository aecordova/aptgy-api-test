class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :recipient

  validate :is_within_daily_gift_limit, :is_within_recipient_limit

  include Filterable

  enum gift_type: { MUG: 1, T_SHIRT: 2, HOODIE: 3, STICKER: 4 }

  private

  def is_within_daily_gift_limit
     return unless school.ordered_gifts_on order.date + quantity > MAX_ITEMS_PER_DAY
        
     errors.add(:gift_count, "Daily gift limit exceeded, Max: #{MAX_ITEMS_PER_DAY}")
  end

  def is_within_recipient_limit
    recipients = if order.recipient_list.includes?  recipient_id 
                  order.recipient_count 
                 else
                  order.recipient_count + 1
                 end

    return unless recipients > MAX_RECIPIENTS_PER_ORDER
      
    errors.add(:order_items, "Recipient limit exceeded, Max: #{MAX_RECIPIENTS}")
  end

end
