class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :device
      t.string :imei
      t.decimal :value, precision: 8, scale: 2
      t.integer :installments

      t.timestamps
    end
  end
end
