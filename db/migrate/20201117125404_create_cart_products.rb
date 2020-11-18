class CreateCartProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_products do |t|
      t.integer :product_id
      t.integer :customer_id
      t.integer :quantity
      t.timestamp :updated_at
      t.timestamp :created_at

      t.timestamps
    end
  end
end
