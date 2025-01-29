class CreateShoppingCars < ActiveRecord::Migration[7.1]
  def change
    create_table :shopping_cars do |t|

      t.timestamps
    end
  end
end
