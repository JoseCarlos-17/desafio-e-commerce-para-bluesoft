require 'rails_helper'

RSpec.describe "ShoppingCarProducts", type: :request do
  describe "POST#create" do
    context 'when a product is added to user shopping car' do
      let(:product) { create(:product) }
      let(:shopping_car) { create(:shopping_car) }
      let(:shopping_car_product_params) { attributes_for(:shopping_car_product,
        product_id: product.id, shopping_car_id: shopping_car.id,
        quantity: 1) }
      
      before do
        product
        shopping_car

        post '/shopping_car_products',
        params: { shopping_car_product: shopping_car_product_params }
      end

      it 'must return the 201 status code' do
        expect(response).to have_http_status(:created)
      end

      it 'must return the shopping car attributes' do
        expect(json_body).to include(:id, :name, :quantity)
      end
    end
  end

  describe "DELETE#destroy" do
    context 'when a product is removed from the shopping_car' do
      let(:product) { create(:product) }
      let(:shopping_car) { create(:shopping_car) }
      let(:shopping_car_product) { create(:shopping_car_product,
        product_id: product.id, shopping_car_id: shopping_car.id,
        quantity: 1) }
      
      before do
        product
        shopping_car
        shopping_car_product

        delete "/shopping_car_products/#{shopping_car_product.id}"
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
