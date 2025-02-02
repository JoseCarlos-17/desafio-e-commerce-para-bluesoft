require 'rails_helper'

RSpec.describe "ShoppingCarProducts", type: :request do
  let(:user) { create(:user) }
  describe "GET#index" do
    context 'when have products to be listed' do
      let(:product) { create(:product) }
      let(:shopping_car) { create(:shopping_car, user_id: user.id) }
      let(:shopping_car_products) { create_list(:shopping_car_product, 2,
        product_id: product.id, shopping_car_id: shopping_car.id,
        quantity: 3) }

      before do
        product
        shopping_car
        shopping_car_products

        get '/shopping_car_products',
        headers: get_headers(user)
      end

      it 'must return 200 status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'must return shopping_car products' do
        expect(json_body[0]).to include(:id, :product_name, :value, :quantity, :shopping_car)
        expect(json_body[0][:shopping_car]).to include(:id, :user)
      end
    end
  end

  describe "POST#create" do
    context 'when a product is added to user shopping car' do
      let(:product) { create(:product) }
      let(:shopping_car) { create(:shopping_car, user_id: user.id) }
      let(:shopping_car_product_params) { attributes_for(:shopping_car_product,
        product_id: product.id, shopping_car_id: shopping_car.id,
        quantity: 1) }
      
      before do
        product
        shopping_car

        post '/shopping_car_products', headers: get_headers(user),
        params: { shopping_car_product: shopping_car_product_params }
      end

      it 'must return the 201 status code' do
        expect(response).to have_http_status(:created)
      end

      it 'must return the shopping car attributes' do
        expect(json_body).to include(:id, :product_name, :value, :quantity, :shopping_car)
        expect(json_body[:shopping_car]).to include(:id, :user)
      end
    end
  end

  describe "PUT#update" do
    context 'when a product has your quantity updated' do
      let(:product) { create(:product) }
      let(:shopping_car) { create(:shopping_car, user_id: user.id) }
      let(:shopping_car_product) { create(:shopping_car_product,
        product_id: product.id, shopping_car_id: shopping_car.id,
        quantity: 1) }
      let(:shopping_car_product_update_params) { { quantity: 3 } }
      
      before do
        product
        shopping_car
        shopping_car_product

        put "/shopping_car_products/#{shopping_car_product.id}", headers: get_headers(user),
        params: { shopping_car_product: shopping_car_product_update_params }
      end

      it 'must return 204 status code' do
        expect(response).to have_http_status(:no_content)
      end
    end
  end

  describe "DELETE#destroy" do
    context 'when a product is removed from the shopping_car' do
      let(:product) { create(:product) }
      let(:shopping_car) { create(:shopping_car, user_id: user.id) }
      let(:shopping_car_product) { create(:shopping_car_product,
        product_id: product.id, shopping_car_id: shopping_car.id,
        quantity: 1) }
      
      before do
        product
        shopping_car
        shopping_car_product

        delete "/shopping_car_products/#{shopping_car_product.id}", headers: get_headers(user)
      end

      it 'must return 204 status code' do
        expect(response).to have_http_status(:no_content)
      end

      it 'the shopping_car_product must to be removed' do
        expect(ShoppingCarProduct.count).to eq(0)
      end
    end
  end
end
