class Sandwich
    attr_reader :taste, :toppings 
    def initialize(taste, toppings)
        @taste = taste
        @toppings = toppings
    end
end

RSpec.describe 'An ideal sandwich' do
    let(:sandwich) { Sandwich.new('delicious',[]) }
    
    it 'is delicious' do
        taste = sandwich.taste
        expect(taste).to eq('delicious')
    end
    
    it 'lets me add toppings' do
        toppings = sandwich.toppings << 'shrimps'
        expect(toppings).not_to be_empty
    end
end
    