class Products::Index::ProductsSerializer < ActiveModel::Serializer
  attributes :id, :name, :price
end
