require 'rails_helper'

RSpec.describe ShoppingCarProduct, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:product) }
    it { is_expected.to belong_to(:shopping_car) }
  end
end
