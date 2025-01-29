class ShoppingCarProduct < ApplicationRecord
  belongs_to :product
  belongs_to :shopping_car
end
