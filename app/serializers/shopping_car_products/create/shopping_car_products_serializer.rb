class ShoppingCarProducts::Create::ShoppingCarProductsSerializer < ActiveModel::Serializer
  attributes :id, :name, :quantity

  def name
    object.product.name
  end
end
