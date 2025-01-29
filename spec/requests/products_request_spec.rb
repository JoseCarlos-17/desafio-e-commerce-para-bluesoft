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
end
