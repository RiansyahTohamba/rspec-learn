require_relative '../models/product.rb'
class CartService
    attr_reader :products

    def initialize
      @products ||= []
    end

    def add_product(product_id, quantity)
      product = @products.find {|prd| prd[:id] == product_id}
      if product 
        product[:quantity] += quantity
      else
        @products << { id: product_id, quantity: quantity}
      end
      @products
    end

    def total_price      
      @products&.sum {|prd| prd[:quantity] * Product.new.find(prd[:id])[:price]} || 0
    end

    def remove_product(product_id)
      @products.delete(product_id)
    end

    def clear_cart
      @products.clear
    end
end