class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  MAX_ITEMS_PER_DAY = 60
  MAX_RECIPIENTS_PER_ORDER = 2
end
