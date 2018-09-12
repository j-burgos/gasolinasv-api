class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.date :from
      t.date :to
      t.decimal :price

      t.belongs_to :zone, index: true
      t.belongs_to :gas_type, index: true

      t.timestamps
    end
  end
end
