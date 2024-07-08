RSpec.describe Cart, type: :model do

    describe "adding items to the cart" do
      it "should add an item to the cart" do
        # Arrange
        cart = Cart.new
        item = Product.create(name: "T-Shirt", price: 20)
  
        # Act
        cart.add_item(item)
  
        # Assert
        expect(cart.items.size).to eq(1)
        expect(cart.items.first).to eq(item)
      end
    end
  
    describe "removing items from the cart" do
      it "should remove an item from the cart" do
        # Arrange
        cart = Cart.new
        item = Product.create(name: "T-Shirt", price: 20)
        cart.add_item(item)
  
        # Act
        cart.remove_item(item)
  
        # Assert
        expect(cart.items.empty?).to be true
      end
    end
  
    describe "calculating the total price" do
      it "should calculate the total price of all items in the cart" do
        # Arrange
        cart = Cart.new
        item1 = Product.create(name: "T-Shirt", price: 20)
        item2 = Product.create(name: "Hat", price: 15)
        cart.add_item(item1)
        cart.add_item(item2)
  
        # Act
        total_price = cart.total_price
  
        # Assert
        expect(total_price).to eq(35)
      end
    end
  
    # You can add more scenarios here to test different functionalities of the cart
  
  end
  