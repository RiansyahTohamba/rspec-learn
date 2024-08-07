const express = require('express');
const bodyParser = require('body-parser');
const session = require('express-session');
const RedisStore = require('connect-redis')(session);
const { createClient } = require('redis');
const app = express();
const port = 12724;

// Create Redis client
const redisClient = createClient({
  host: 'localhost', // Adjust if Redis is running on a different host or port
  port: 6379
});

redisClient.on('error', (err) => {
  console.error('Redis error: ', err);
});

app.set('view engine', 'ejs');
app.use(express.static('public'));
app.use(bodyParser.urlencoded({ extended: true }));

app.use(session({
  store: new RedisStore({ client: redisClient }),
  secret: 'your-secret-key',
  resave: false,
  saveUninitialized: false,
  cookie: { secure: false } // Set to true if using HTTPS
}));

const products = [
  { id: 1, name: 'Product 1', description: 'Description of Product 1', price: 10 },
  { id: 2, name: 'Product 2', description: 'Description of Product 2', price: 20 },
  { id: 3, name: 'Product 3', description: 'Description of Product 3', price: 30 }
];

app.get('/', (req, res) => {
  res.render('index');
});

app.get('/products', (req, res) => {
  res.render('product-list', { products });
});

app.post('/add-to-cart', (req, res) => {
  if (!req.session.cart) {
    req.session.cart = [];
  }

  const productId = parseInt(req.body.productId);
  const product = products.find(p => p.id === productId);

  if (product) {
    const cartItem = req.session.cart.find(item => item.id === productId);
    if (cartItem) {
      cartItem.quantity++;
    } else {
      req.session.cart.push({ ...product, quantity: 1 });
    }
  }
  res.redirect('/cart');
});

app.get('/cart', (req, res) => {
  res.render('shopping-cart', { cart: req.session.cart || [] });
});

app.post('/checkout', (req, res) => {
  req.session.cart = [];
  res.redirect('/cart');
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
