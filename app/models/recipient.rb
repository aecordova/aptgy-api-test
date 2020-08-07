class Recipient < ApplicationRecord
  belongs_to :school
  has_many :orders

  include Filterable
end
