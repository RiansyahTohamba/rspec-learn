class Shipping <  ApplicationRecord
  belongs_to :order
  belongs_to :shipper
  
end