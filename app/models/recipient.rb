class Recipient < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true

  belongs_to :school
  has_many :orders

  include Filterable
end
