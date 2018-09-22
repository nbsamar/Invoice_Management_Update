class Collection < ApplicationRecord
  belongs_to :invoice, optional: true
end
