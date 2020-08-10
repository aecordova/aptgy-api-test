class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :recipient

  after_update :mark_for_notification

  enum gift_type: { MUG: 1, T_SHIRT: 2, HOODIE: 3, STICKER: 4 }

end
