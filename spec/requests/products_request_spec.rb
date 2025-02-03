require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET#index" do
    context 'when some products are listed' do
      let(:products) { create_list(:product, 3) }

      before do
        products

        get '/products'
      end

      it 'must return 200 status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'return the attributes of one product' do
        expect(json_body[0]).to include(:id, :name, :price)
      end
    end
  end

  describe "GET#show" do
    context 'when a product is chosed and your details are readed' do
      let(:product) { create(:product) }

      before do
        product

        get "/products/#{product.id}"
      end

      it 'must return 200 status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'must return the product selected attributes' do
        expect(json_body).to include(:id, :name, :price)
      end
    end
  end
end
