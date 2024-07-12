class Cart
    attr_reader :cart
    def initialize
        @cart = []
    end

    def add_product(product)
        @cart << product
    end

    def total_price
        total = @cart.reduce(0) {|sum,product| sum + product.price }
        return total 
    end
end