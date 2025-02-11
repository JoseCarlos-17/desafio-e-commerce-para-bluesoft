class CreateShoppingCarProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :shopping_car_products do |t|
      t.references :product, null: false, foreign_key: true
      t.references :shopping_car, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
