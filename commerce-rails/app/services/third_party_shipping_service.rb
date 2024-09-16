class ThirdPartyShippingService
  def initialize(api_credentials)
      @api_url =  ENV['THIRD_PARTY_SHIPPING_URL']
      @api_credentials = api_credentials
  end

  def get_cost(city_to)
      # response = RestClient.get("#{@api_url}/shipping/cost", params: { city_to: city_to })
      response = OpenStruct.new(body: '{"cost": 1000000}')
      res = JSON.parse(response.body)
      res['cost']
  end
end
