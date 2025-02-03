require 'rails_helper'

RSpec.describe "Auth::RegistrationsController", type: :request do
  describe "POST#sign_up" do
    context 'when a new user is created' do
      let(:user) { attributes_for(:user, name: "efg",
        email: "userefg@gmail.com", password: "12345678",
        password_confirmation: "12345678") }

        before do
          post '/auth', params: user
        end

        it 'must return status 200' do
          expect(response).to have_http_status(:ok)
        end

        it 'must return created attributes' do
          expect(json_body).to include(:status, :data)
          expect(json_body[:data]).to include(:email, :provider, :uid,
                                              :id, :allow_password_change,
                                              :name, :nickname, :image)
        end
    end
  end
end
