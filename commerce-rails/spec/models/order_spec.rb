require 'rails_helper'
# SKIP USER LOGIN
#include Devise::Test::ControllerHelpers

# before do
#   @user = FactoryBot.create(:user)
#   sign_in @user
# end

RSpec.describe Order, type: :model do
  let(:od_has_two) { create(:order) } 
  let(:line_sho) { create(:line_item, :line_sholat, order: od_has_two) }
  let(:line_pre) { create(:line_item, :line_pressman, order: od_has_two) }

  # order_status = Order  
  describe 'State Machine of order' do
    let(:pending_order) { create(:order, :pending) }
    let(:paid_order) { create(:order, :paid) }
    let(:shipped_order) { create(:order, :shipped) }
    
    # let(:item_prev_stock) { Item.find_by(id: 10).stock }
    before do
      
    end

    it 'create order with state=PENDING' do
    end

    it 'create order with state=PAID' do
      # recent_stock = item.item_prev_stock - order.qty
      # expect(recent_stock).eq (10)
    end

    it 'create order with state=CANCELED' do
      # order_status = 1
      # expect(order_status).to eq()
    end

    it 'create order with state=DENIED' do
    end
    
    it 'create order with state=EXPIRED' do
    end
    
  end

  describe 'Total Price' do
    
    it 'should correctly count the total price' do
      total_qty = line_sho.quantity + line_pre.quantity
      total_price = (line_sho.quantity * line_sho.item.price) + (line_pre.quantity * line_pre.item.price)
      expect(od_has_two.line_items.sum(:quantity)).to eq(total_qty)
      expect(od_has_two.total_price).to eq(total_price)
    end

    describe 'Shipping Price Effect' do
      let(:item_cost) { 80000 }
      let(:jne_kdi_cost) { create(:shipping, :jne_kdi) }
      let(:cart_with_items) { create(:cart, :with_line_items) }
      let(:empty_cart) { create(:cart) }
      
    
      specify 'total cost will be change based on shipping address & type' do
        total_price = od_has_two.total_price + jne_kdi_cost.cost
        expect(od_has_two.total_price(shp_cos)).to eq(total_price)
      end  
    end

    describe 'With Discount' do
      # describe 'total price with percentage discount' do
    #   let(:order) { create(:order) }
    #   let(:line_item1) { create(:line_item, order: order, quantity: 2, item: create(:item, price: 100)) }
    #   let(:line_item2) { create(:line_item, order: order, quantity: 1, item: create(:item, price: 200)) }
    
    #   before do
    #     order.discount_percentage = 10
    #   end
    
    #   it 'applies the discount correctly' do
    #     total_price = (line_item1.quantity * line_item1.item.price) + (line_item2.quantity * line_item2.item.price)
    #     discounted_price = total_price * 0.9 # Mengurangi 10%
        
    #     expect(order.total_price).to eq(discounted_price)
    #   end
    # end
  
    # describe 'total price with fixed amount discount' do
    #   let(:order) { create(:order) }
    #   let(:line_item1) { create(:line_item, order: order, quantity: 2, product: create(:product, price: 100)) }
    #   let(:line_item2) { create(:line_item, order: order, quantity: 1, product: create(:product, price: 200)) }
    
    #   before do
    #     order.discount_amount = 50_000
    #   end
    
    #   it 'applies the fixed discount correctly' do
    #     total_price = (line_item1.quantity * line_item1.product.price) + (line_item2.quantity * line_item2.product.price)
    #     discounted_price = total_price - 50_000
        
    #     expect(order.total_price).to eq(discounted_price)
    #   end
    # end
    # describe 'total price with product-specific discount' do
    #   let(:order) { create(:order) }
    #   let(:product_with_discount) { create(:product, price: 100) }
    #   let(:product_without_discount) { create(:product, price: 200) }
    #   let(:line_item1) { create(:line_item, order: order, quantity: 2, product: product_with_discount) }
    #   let(:line_item2) { create(:line_item, order: order, quantity: 1, product: product_without_discount) }
    
    #   before do
    #     product_with_discount.discount_percentage = 20
    #   end
    
    #   it 'applies the discount correctly only to the discounted product' do
    #     discounted_price = (product_with_discount.price * 0.8) * line_item1.quantity
    #     total_price = discounted_price + (product_without_discount.price * line_item2.quantity)
        
    #     expect(order.total_price).to eq(total_price)
    #   end
    # end
    end
  end
  
  

  
end
