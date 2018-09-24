class Invoice < ApplicationRecord
  validates_presence_of :amount, :reference, :brand_manager, :invoice_date, :customer_name

  has_many :collections
end
