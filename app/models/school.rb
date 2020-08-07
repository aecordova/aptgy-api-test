class School < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  has_many :recipients
  has_many :orders
end
