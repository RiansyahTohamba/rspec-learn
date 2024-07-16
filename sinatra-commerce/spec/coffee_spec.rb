require 'spec_helper'
class Coffee
    def initialize()
    end
    
    def ingredients
        @ingredients ||= []
    end
    
    def add(ingredient)
        ingredients << ingredient
    end

    def price
        ingredients.include?(:milk) ? 1.25 : 1.00
    end
    
    def color 
        ingredients.include?(:milk) ? :dark : :light
    end

    def temperature
        ingredients.include?(:milk) ? 170 : 180
    end

end

RSpec.describe Coffee do 
    let(:coffee) { Coffee.new}
    
    it 'costs $1' do
        expect(coffee.price).to eq(1.00)
    end

    # context 'with milk', focus: true do
    context 'with milk' do
        before { coffee.add :milk}
        it 'costs $1.25' do 
            expect(coffee.price).to eq(1.25)
        end
    end
    
    it 'is light in color' do
        # pending 'Color not implemented yet'
        expect(coffee.color).to be(:light)
    end

    it 'is cooler than 200 degrees Fahrenheit' do
        # pending 'Temperature not implemented yet'
        expect(coffee.temperature).to be < 200.0
    end
end