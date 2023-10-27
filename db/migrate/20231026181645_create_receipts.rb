class CreateReceipts < ActiveRecord::Migration[6.0]
  def change
    create_table :receipts do |t|
      t.string :retailer
      t.string :total

      t.timestamps
    end
  end
end
