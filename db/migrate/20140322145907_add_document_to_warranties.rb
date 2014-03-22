class AddDocumentToWarranties < ActiveRecord::Migration
  def change
    add_column :warranties, :document, :string
  end
end
