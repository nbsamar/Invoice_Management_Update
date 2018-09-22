# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

json_invoice = ActiveSupport::JSON.decode(File.read('db/seeds/invoices.json'))

json_invoice.each do |invoice|
  Invoice.create!(invoice)
end

json_collection = ActiveSupport::JSON.decode(File.read('db/seeds/collections.json'))

json_collection.each do |collection|
  inv_id = Invoice.find_by(reference: collection["reference"])&.id

  # byebug if inv_id.nil?

  Collection.create!((collection).merge(invoice_id: inv_id))
end
