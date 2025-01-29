class ProductsController < ApplicationController
  def index
    products = Product.all

    render json: products,
           each_serializer: Products::Index::ProductsSerializer,
           status: :ok
  end

  def show

    render json: { message: "action show is working" }, status: :ok
  end
end
