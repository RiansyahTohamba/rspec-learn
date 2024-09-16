require 'rails_helper'
RSpec.describe Shipping, type: :model do
  let(:shipper) { create(:shipper) }
  let(:city_to) { "Destination City" }

  before do
    # Mock ThirdPartyShippingService
    api_credentials = 'dummy_api_key'
    allow(ThirdPartyShippingService).to receive(:new)
      .with(api_credentials).and_return(service_double)
    allow(service_double).to receive(:get_cost).with(city_to).and_return(50000)
  end

  let(:service_double) { instance_double(ThirdPartyShippingService) }

  it 'calculates the shipping cost' do
    cost = shipper.calculate_shipping_cost(city_to)
    expect(cost).to eq(50000)
  end

end