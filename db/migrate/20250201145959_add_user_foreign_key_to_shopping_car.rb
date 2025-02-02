class AddUserForeignKeyToShoppingCar < ActiveRecord::Migration[7.1]
  def change
    add_reference :shopping_cars, :user, null: false, foreign_key: true
  end
end
