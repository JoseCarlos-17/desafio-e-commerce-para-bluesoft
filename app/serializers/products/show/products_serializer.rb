class Products::Show::ProductsSerializer < ActiveModel::Serializer
  attributes :id, :name, :price
end
