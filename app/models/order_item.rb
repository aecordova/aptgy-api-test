class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :recipient

  validate :is_within_daily_gift_limit, :is_within_recipient_limit
  validate :order_not_shipped, on: :update

  include Filterable

  enum gift_type: { MUG: 1, T_SHIRT: 2, HOODIE: 3, STICKER: 4 }

  private

  def within_daily_gift_limit
    already_ordered = order.school.ordered_gifts_on order.date
    return unless (already_ordered + quantity) > MAX_ITEMS_PER_DAY

    errors.add('Gift Count:', "Daily gift limit exceeded, Max: #{MAX_ITEMS_PER_DAY}")
  end

  def within_recipient_limit
    recipients = if order.recipient_id_list.include? recipient_id
                   order.recipient_count
                 else
                   order.recipient_count + 1
                 end
    return unless recipients > MAX_RECIPIENTS_PER_ORDER

    errors.add('Recipient Count:',
               "Recipient limit exceeded, Max: #{MAX_RECIPIENTS_PER_ORDER}")
  end

  def order_not_shipped
    return unless order.ORDER_SHIPPED? || order.ORDER_CANCELLED?

    errors.add('Status:', "Can't modify order items when #{order.status}")
  end
end
