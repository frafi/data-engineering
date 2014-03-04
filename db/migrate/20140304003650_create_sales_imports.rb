class CreateSalesImports < ActiveRecord::Migration
  def change
    create_table :sales_imports do |t|
      t.string :document_file_name
      t.string :document_content_type
      t.integer :document_file_size
      t.decimal :gross_revenue, null: false, default: 0

      t.timestamps
    end
  end
end
