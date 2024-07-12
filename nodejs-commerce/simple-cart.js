const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = 12724;

app.set('view engine', 'ejs');
app.use(express.static('public'));
app.use(bodyParser.urlencoded({ extended: true }));

const products = [
  { id: 1, name: 'Product 1', description: 'Description of Product 1', price: 10 },
  { id: 2, name: 'Product 2', description: 'Description of Product 2', price: 20 },
  { id: 3, name: 'Product 3', description: 'Description of Product 3', price: 30 }
];

let cart = [];

app.get('/', (req, res) => {

    res.render('product-list', { products, cart });
});


app.post('/add-to-cart', (req, res) => {
  const productId = parseInt(req.body.productId);
  const product = products.find(p => p.id === productId);

  if (product) {
    const cartItem = cart.find(item => item.id === productId);
    if (cartItem) {
      cartItem.quantity++;
    } else {
      cart.push({ ...product, quantity: 1 });
    }
  }
  res.redirect('/');
});

app.get('/cart', (req, res) => {
  res.render('shopping-cart', { cart });
});

app.post('/checkout', (req, res) => {
  cart = [];
  res.redirect('/cart');
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
