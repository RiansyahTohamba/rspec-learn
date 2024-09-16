class Shipper < ApplicationRecord
  # def initialize(api_credentials)
  # end
  def calculate_shipping_cost(city_to)
    shipper_service = ThirdPartyShippingService.new(api_credentials)
    shipper_service.get_cost(city_to)
  end
end
