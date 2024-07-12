class Product
    
    SEED_PRODUCT = [
        { id: 1, name: 'Bilabong', price: 10.0 },
        { id: 2, name: 'Pressman: Software Engineering', price: 20.0 },
        { id: 3, name: 'John Ousterhout: Software Design Phillosopy', price: 30.0 }
    ]

    def find(id)
        SEED_PRODUCT.find {|prd| prd[:id] == id}
    end

end
