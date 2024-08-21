# spec/models/order_spec.rb

require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:order_items) }
    it { should have_many(:products).through(:order_items) }
  end

  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:status) }
    it { should validate_inclusion_of(:status).in_array(%w[pending paid shipped completed canceled]) }
  end

  describe '#total_price' do
    context 'when the order has multiple items' do
      it 'calculates the total price correctly' do
        user = create(:user)
        order = create(:order, user: user)
        product1 = create(:product, price: 100)
        product2 = create(:product, price: 200)
        
        create(:order_item, order: order, product: product1, quantity: 2)
        create(:order_item, order: order, product: product2, quantity: 1)
        
        expect(order.total_price).to eq(400)
      end
    end

    context 'when the order has no items' do
      it 'returns a total price of zero' do
        order = create(:order)
        expect(order.total_price).to eq(0)
      end
    end
  end

  describe '#mark_as_paid!' do
    context 'when the order status is pending' do
      it 'changes the status of the order to paid' do
        order = create(:order, status: 'pending')
        order.mark_as_paid!
        
        expect(order.status).to eq('paid')
      end
    end
  end

  describe '#cancel!' do
    context 'when the order status is pending' do
      it 'changes the status of the order to canceled' do
        order = create(:order, status: 'pending')
        order.cancel!
        
        expect(order.status).to eq('canceled')
      end
    end

    context 'when the order status is already paid' do
      it 'does not change the status to canceled' do
        order = create(:order, status: 'paid')
        order.cancel!
        
        expect(order.status).not_to eq('canceled')
        expect(order.status).to eq('paid')
      end
    end
  end
end
