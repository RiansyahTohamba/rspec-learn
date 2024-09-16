class Address < ApplicationRecord
  belongs_to :user

  validates :city, :street, :postal_code, presence: true
end