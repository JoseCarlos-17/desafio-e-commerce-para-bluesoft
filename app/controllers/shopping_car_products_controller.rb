class ShoppingCarProductsController < ApplicationController
  def create
    shopping_car_product = ShoppingCarProduct.create!(shopping_car_product_params)

    render json: shopping_car_product,
           serializer: ShoppingCarProducts::Create::ShoppingCarProductsSerializer,
           status: :created
  end

  def update
    shopping_car_product = ShoppingCarProduct.find(params[:id])

    shopping_car_product.update!(shopping_car_product_params)

    head :no_content
  end

  def destroy
    shopping_car_product = ShoppingCarProduct.find(params[:id])

    shopping_car_product.destroy!

    head :no_content
  end

  def shopping_car_product_params
    params.require(:shopping_car_product).permit(:product_id, :shopping_car_id, :quantity)
  end
end
