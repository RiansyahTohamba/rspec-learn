// app/javascript/calculate_price.js

document.addEventListener('turbo:load', () => {
    console.log('aku calculate price')
    const courierSelect = document.getElementById('courier_select');
    const addressSelect = document.getElementById('order_address_id');
  
    if (courierSelect && addressSelect) {
      courierSelect.addEventListener('change', updateTotalPrice);
      addressSelect.addEventListener('change', updateTotalPrice);
    }
});
  
function updateTotalPrice() {
  const courier = document.getElementById('courier_select').value;
  const addressId = document.getElementById('order_address_id').value;

  fetch(`/orders/calculate_price?courier=${courier}&address_id=${addressId}`)
    .then(response => response.json())
    .then(data => {
      document.getElementById('total_price').innerText = data.total_price;
    });
}

