require 'sinatra'
require 'sinatra/reloader' if development?
require './app/services/cart_service'

configure do
    enable :sessions
    set :session_secret, SecureRandom.hex(32)
    set :port, 20248 
end
# Sample product list
PRODUCTS = [
  { id: 1, name: 'Product 1', price: 10.0 },
  { id: 2, name: 'Product 2', price: 20.0 },
  { id: 3, name: 'Product 3', price: 30.0 }
]

helpers do
  def find_product(id)
    PRODUCTS.find { |product| product[:id] == id }
  end

end

get '/' do
  session[:cart] ||= CartService.new
  erb :index
end

post '/add_to_cart' do
  product_id = params[:product_id].to_i
  quantity = params[:quantity].to_i

  session[:cart].add_product(product_id,quantity)

  redirect '/'
end

get '/cart' do
  erb :cart
end
 
__END__

@@ layout
<!DOCTYPE html>
<html>
<head>
  <title>Simple Sinatra Shopping Cart</title>
</head>
<body>
  <%= yield %>
</body>
</html>

@@ index
<h1>Checkout Page</h1>
<h2>Choose Shipping address </h2>
<p>place logic here </p>

<h2>Choose Payment </h2>
<p>place logic here </p>

<h1>Your Cart</h1>

<% if session[:cart].products.nil? || session[:cart].products.empty? %>
  <p>Your cart is empty.</p>
<% else %>
  <ul>
  <%  session[:cart].products.each do |item| %>
      <%  product = find_product(item[:id]) %>
      <li>
      <%= product[:name] %> 
      - Quantity: <%= item[:quantity] %> 
      - Price: $ <%= product[:price] %> 
      - Sub-Total: $<%= product[:price] * item[:quantity] %>
      </li>
     <% end %>
  </ul>
  <p>Total: <%= session[:cart].total_price %></p>
<% end %>

<h1>Product List</h1>
<ul>
  <% PRODUCTS.each do |product| %>
    <li>
      <%= product[:name] %> - $<%= product[:price] %>
      <form action="/add_to_cart" method="post" style="display:inline;">
        <input type="hidden" name="product_id" value="<%= product[:id] %>">
        <input type="number" name="quantity" value="1" min="1">
        <input type="submit" value="Add to Cart">
      </form>
    </li>
  <% end %>
</ul>

<a href="/cart">View Cart</a>

@@ cart
<h1>Your Cart</h1>
<% if session[:cart].nil? || session[:cart].empty? %>
  <p>Your cart is empty.</p>
<% else %>
  <ul>
    <% session[:cart].each do |item| %>
      <% product = find_product(item[:id]) %>
      <li>
        <%= product[:name] %> - Quantity: <%= item[:quantity] %> - Price: $<%= product[:price] %>
      </li>
    <% end %>
  </ul>
  <p>Total: $<%= session[:cart].total_price %></p>
<% end %>
<a href="/">Back to Products</a>
