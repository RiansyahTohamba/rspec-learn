# spec/services/cart_service_spec.rb

require 'rspec'
require_relative '../spec_helper'
require_relative '../../app/services/cart_service'

describe CartService do
    before(:each) do
        @product1 = { id:1, quantity:11}
        @product2 = { id:2, quantity:12}
        @cart = CartService.new
        @cart.add_product(@product1[:id],@product1[:quantity])
    end

    describe 'adding products to the cart' do
        it 'adds single products to the cart' do
            expect(@cart.products.length).to eq(1)
        end
        it 'adds multiple products to the cart' do
            @cart.add_product(@product2[:id],@product2[:quantity])
            expect(@cart.products.length).to eq(2)
        end
    end

    describe 'calculating the price' do    
        it 'calculates the price for single products in the cart' do 
            p1 = @product1[:quantity] * 10.0
            expect(@cart.total_price).to eq(p1)
        end

        it 'calculates the total price for multiple products in the cart' do 
            p1 = @product1[:quantity] * 10.0
            p2 = @product2[:quantity] * 20.0
            @cart.add_product(@product2[:id],@product2[:quantity])
            expect(@cart.total_price).to eq(p1+p2)
        end
        
        # ditambah lalu dihapus itemnya
        it 'should decrease the total price when an item is removed' do
            pending 'remove item not implemented yet'
            @cart.remove_item()
        end

        it 'should apply discounts or promotions correctly' do
            pending 'discount not implemented yet'
            @cart.count_discount()
        end
        
    end
end


  # it 'adds products to the cart' do
  #   cart_service.add_product('123')
  #   expect(cart_service.cart).to include('123')
  # end

  # it 'removes products from the cart' do
  #   cart_service.add_product('123')
  #   cart_service.remove_item('123')
  #   expect(cart_service.cart).not_to include('123')
  # end

  # it 'clears the cart' do
  #   cart_service.add_product('123')
  #   cart_service.clear_cart
  #   expect(cart_service.cart).to be_empty
  # end