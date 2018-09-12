class CreateGasTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :gas_types do |t|
      t.string :name
      t.string :identifier, :index => true, :unique => true

      t.timestamps
    end
  end
end
