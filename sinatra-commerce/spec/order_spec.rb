require_relative '../app/models/order'
require_relative '../app/models/payment_processor'
require 'spec_helper'

RSpec.describe Order do 
    let(:payment_processor) { instance_double(PaymentProcessor)}
    subject { described_class.new(payment_processor) }

    describe '#process' do
        it 'processes the order without actually making a payment' do

            amount = 100
            expect(payment_processor).to receive(:pay).with(amount)
            result = subject.process(amount)
            expect(result).to eq("Order processed successfully")
        end
        
    end
end