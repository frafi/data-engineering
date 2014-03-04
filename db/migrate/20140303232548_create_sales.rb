class CreateSale < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :purchaser_name
      t.integer :quantity
      t.references :item
      t.references :merchant

      t.timestamps
    end
  end
end
