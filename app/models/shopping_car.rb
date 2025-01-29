class ShoppingCar < ApplicationRecord
  has_many :shopping_car_products
  has_many :products, through: :shopping_car_products
end
