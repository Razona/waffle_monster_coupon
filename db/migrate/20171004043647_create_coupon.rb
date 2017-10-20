class CreateCoupon < ActiveRecord::Migration[5.1]
  def change
    create_table :coupons do |t|
      t.integer :coupon_code
      t.boolean :mode
      t.timestamps null: false
    end
  end
end
