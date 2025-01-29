class ProductsController < ApplicationController
  def index
    products = Product.all

    render json: products,
           each_serializer: Products::Index::ProductsSerializer,
           status: :ok
  end
end
