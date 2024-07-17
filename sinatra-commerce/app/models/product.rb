class Product
    attr_reader :price, :name
    PRODUCTS = [
        { id: 1, name: 'Product 1', price: 10.0 },
        { id: 2, name: 'Product 2', price: 20.0 },
        { id: 3, name: 'Product 3', price: 30.0 }
    ]

    def initialize(name,price)
        @price = price
        @name = name
    end

    def self.find(id)
        PRODUCTS.find { |product| product[:id] == id }
    end
    def self.all
        PRODUCTS
    end
end