require 'rails_helper'

RSpec.describe "ShoppingCars", type: :request do
  let(:user) { create(:user) }

  # describe "GET#index" do
  #   context 'when have products to be listed' do
  #     let(:product) { create(:product) }
  #     let(:shopping_car) { create(:shopping_car, user_id: user.id) }
  #     let(:shopping_car_product) { create(:shopping_car_product,
  #       product_id: product.id, shopping_car_id: shopping_car.id,
  #       quantity: 1) }

  #     before do
  #       product
  #       shopping_car
  #       shopping_car_product

  #       get '/shopping_cars/products',
  #       headers: get_headers(user)
  #     end

  #     it 'must return 200 status code' do
  #       expect(response).to have_http_status(:ok)
  #     end

  #     it 'must return shopping_car products' do
  #       expect(json_body[0]).to include(:id, :price, :name)
  #     end
  #   end
  # end
end
