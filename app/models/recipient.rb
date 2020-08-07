class Recipient < ApplicationRecord
  belongs_to :school

  include Filterable
end
