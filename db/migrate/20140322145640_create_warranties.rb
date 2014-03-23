class CreateWarranties < ActiveRecord::Migration
  def change
    create_table :warranties do |t|
      t.references :product, index: true
      t.date :purchase_date
      t.integer :duration
      t.boolean :lifetime, default: false
      t.string :details

      t.timestamps
    end
  end
end
