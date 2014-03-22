class CreateWarranties < ActiveRecord::Migration
  def change
    create_table :warranties do |t|
      t.date :purchase
      t.integer :duration
      t.references :product, index: true
      t.string :details

      t.timestamps
    end
  end
end
