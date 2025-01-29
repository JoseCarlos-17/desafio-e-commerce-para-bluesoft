class Product < ApplicationRecord
  has_many :shopping_car_products
  has_many :shopping_cars, through: :shopping_car_products
end
