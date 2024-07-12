require 'sinatra'
require 'sinatra/reloader' if development?


configure do
    enable :sessions
    set :session_secret, SecureRandom.hex(32)
    set :port, 20247  # Set the port to 8080
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

  def cart_total
    session[:cart]&.sum { |item| item[:quantity] * find_product(item[:id])[:price] } || 0
  end
end

get '/' do
  erb :index
end

post '/add_to_cart' do
  product_id = params[:product_id].to_i
  quantity = params[:quantity].to_i

  session[:cart] ||= []
  item = session[:cart].find { |i| i[:id] == product_id }

  if item
    item[:quantity] += quantity
  else
    session[:cart] << { id: product_id, quantity: quantity }
  end

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
  <p>Total: $<%= cart_total %></p>
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
  <p>Total: $<%= cart_total %></p>
<% end %>
<a href="/">Back to Products</a>
