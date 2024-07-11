class Cart
    attr_reader :items
    def initialize
        @items = []
    end

    def add_item(item)
        @items << item
    end

    def total_price
        total = @items.reduce(0) {|sum,item| sum + item.price }
        return total 
    end
end