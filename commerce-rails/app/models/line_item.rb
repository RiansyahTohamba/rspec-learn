class LineItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart
  belongs_to :order

  validates :quantity, numericality: { greater_than_or_equal_to: 1 }  

  def total_price
    item.price * quantity
  end
  
end
