class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.references :invoice, foreign_key: true

      t.integer :amount
      t.string :reference
      t.date :collection_date
      t.timestamps
    end
  end
end
