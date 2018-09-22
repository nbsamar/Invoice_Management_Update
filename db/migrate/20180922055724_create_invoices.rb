class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.string :brand_manager
      t.string :narration
      t.datetime :invoice_date
      t.integer :amount
      t.string :customer_name
      t.string :reference
      t.timestamps
    end
  end
end
