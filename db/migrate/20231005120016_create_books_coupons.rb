class CreateBooksCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :books_coupons do |t|
      t.string :code
      t.decimal :discount, precision: 8, scale: 2
      t.datetime :expires_at
      t.integer :max_uses
      t.integer :used_count, default: 0

      t.timestamps
    end
  end
end
