class ShoppingCarProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    shopping_car_products = current_user.shopping_car.shopping_car_products

    render json: shopping_car_products,
           each_serializer: ShoppingCarProducts::Index::ShoppingCarProductsSerializer,
           status: :ok
  end

  def create
    shopping_car_product = ShoppingCarProduct.create!(shopping_car_product_params)

    render json: shopping_car_product,
           serializer: ShoppingCarProducts::Create::ShoppingCarProductsSerializer,
           status: :created
  end

  def update
    shopping_car_product = ShoppingCarProduct.find(params[:id])

    shopping_car_product.update!(shopping_car_product_update_params)

    head :no_content
  end

  def destroy
    shopping_car_product = ShoppingCarProduct.find(params[:id])

    shopping_car_product.destroy!

    head :no_content
  end

  private

  def shopping_car_product_params
    params.require(:shopping_car_product).permit(:product_id, :shopping_car_id, :quantity)
  end

  def shopping_car_product_update_params
    params.require(:shopping_car_product).permit(:quantity)
  end
end
