require 'spec_helper'
require_relative '../app/config/constants'

include BeliDongConstant

class ShippingCalculator
    def initialize
    end 
    def calculate
        100
    end
end
class Order
    # product_subtotal
    # shipping_rate_total
    
    # total = product_subtotal+shipping_rate_total+SERVICE_RATE+FEE_RATE
    def total_price
        product_subtotal = 0
        shipping_rate_total = ShippingCalculator.calculate()
        total = product_subtotal+shipping_rate_total+SERVICE_RATE+FEE_RATE
        total
    end
end

RSpec.describe ShippingCalculator do
    describe 'calculate shipping rate' do
        it 'calculates the correct shipping price' do
            pending 'shipping calculator not implemented yet'
            shipping_rate = ShippingCalculator.calculate()
            expect(shipping_rate).to eq(100)
        end
    end

    describe 'calculate total all product price + shipping rate' do
        it 'calculate the correct total price' do
            pending 'not implemented yet'
            expect(Order.total()).to eq(100)
        end
    end
end 