class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.decimal :total_amount, precision: 8, scale: 2
      t.string :coupon_code

      t.timestamps
    end
  end
end
