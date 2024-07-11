require 'spec_helper'
require_relative '../app/models/product'
require_relative '../app/models/cart'

RSpec.describe Cart do
    before(:each) do
        @price1=20 
        @cart = Cart.new
        item1 = Product.new('Bilabong T-shirt', @price1)
        @cart.add_item(item1)
    end

    describe 'adding items to the cart' do
        it 'adds single items to the cart' do
            expect(@cart.items.length).to eq(1)
        end
        it 'adds multiple items to the cart' do
            @price2=59
            item2 = Product.new('Pressman Books', @price2)        
            @cart.add_item(item2)
            expect(@cart.items.length).to eq(2)
        end
        it 'decreases item count when an item is removed from the cart' do
            # Test logic for removing an item from the cart
        end
    end
    

    describe 'calculating the price' do    
        it 'calculates the price for single items in the cart' do 
            expect(@cart.total_price).to eq(@price1)
        end

        it 'calculates the total price for multiple items in the cart' do 
            @price2=59
            item2 = Product.new('Pressman Books', @price2)        
            @cart.add_item(item2)
            expect(@cart.total_price).to eq(@price1+@price2)
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