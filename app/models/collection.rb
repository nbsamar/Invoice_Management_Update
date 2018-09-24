class Collection < ApplicationRecord
  validates_presence_of :reference, :amount, :collection_date

  belongs_to :invoice, optional: true
end
