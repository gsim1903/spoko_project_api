RSpec.describe 'Update an order with a PUT /api/orders/:id', type: :request do
  let(:user) { create(:user) }
  let(:product_1) { create(:product, name: 'Tshirt') }
  let(:product_2) { create(:product, name: 'Football') }
  let(:product_3) { create(:product, name: 'Scarf') }
  let(:order) { create(:order) }
  let!(:order_item_1) { create(:order_item, order:, product: product_2) }
  let!(:order_item_2) { create(:order_item, order:, product: product_3) }

  subject { response }

  describe 'succesful order' do
    before do
      put "/api/orders/#{order.id}", params: { product_id: product_2.id }
      @order = Order.last
    end

    it { is_expected.to have_http_status :ok }

    it 'response with an order confirmation' do
      expect(response_json['message']).to eq 'Football added'
    end

    it 'is expected to contain 3 items' do
      expect(@order.items.count).to eq 3
    end

    it 'is expected one items to be a Scarf' do
      expect(order.serialized[:products].last["name"]).to eq "Scarf"
    end
    
  end

  describe 'unsuccesful order' do
    before do
      put "/api/orders/#{order.id}", params: { product_id: 999999 }
    end
    it { is_expected.to have_http_status 404 }

    it 'is expected to return an error message' do
      expect(response_json['error']).to eq 'This is product is not available. Please try another.'
    end
  end
end
