class ShoppingCarProducts::Index::ShoppingCarProductsSerializer < ActiveModel::Serializer
  attributes :id, :product_name, :quantity, :value, :shopping_car

  def product_name
    object.product.name
  end

  def value
    object.product.price * object.quantity
  end

  def shopping_car
    {
      id: object.shopping_car_id,
      user: object.shopping_car.user_id
    }
  end
end
