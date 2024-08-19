require 'json'
require 'net/http'
require_relative '../../../app/kyc/dukcapil'

RSpec.describe 'Dukcapil KYC Unit' do
    let(:dukcapil_service) { ExpenseTracker::Dukcapil.new }
    describe 'POST /dukcapil/fr_check' do
        context 'when dukcapil successfully sent respond' do
            it 'returns the score of searching result' do
                response_body = { 'content' => {'score' => 0.8}}.to_json
                uri = URI(ExpenseTracker::Dukcapil::FR_URL)
                allow(Net::HTTP).to receive(:start).with(uri.hostname, uri.port, use_ssl:true)
                    .and_return(double('response',body: response_body))
                debitur = {nik: '7471091819930218831'}
                result = dukcapil_service.fr_check(debitur)
                expect(result.success?).to be(true)
                expect(result.data).to include('score')
            end
        end

        context 'when dukcapil cannot identify debitur' do
            # it 'respond with a 400 status (not found debts)'
        end
    end

    describe 'POST /dukcapil/text_check'

end