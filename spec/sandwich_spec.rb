class Sandwich
    attr_reader :taste, :items 
    def initialize(taste, items)
        @taste = taste
        @items = items
    end
end

RSpec.describe 'An ideal sandwich' do
    it 'is delicious' do
        sandwich = Sandwich.new('delicious',[])
        taste = sandwich.taste
        expect(taste).to eq('delicious')
    end
end
    