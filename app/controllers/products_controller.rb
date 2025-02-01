class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    products = Product.all

    render json: products,
           each_serializer: Products::Index::ProductsSerializer,
           status: :ok
  end

  def show
    product = Product.find(params[:id])

    render json: product,
           serializer: Products::Show::ProductsSerializer,
           status: :ok
  end
end
