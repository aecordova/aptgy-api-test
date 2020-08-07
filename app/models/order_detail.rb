class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :recipient

  enum gift_type: { MUG: 1, T_SHIRT: 2, HOODIE: 3, STICKER: 4 }
end
