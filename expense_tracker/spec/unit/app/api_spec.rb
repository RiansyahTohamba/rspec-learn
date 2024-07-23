require 'rack/test'
require 'json'
require_relative '../../../app/api'

module ExpenseTracker
    RecordResult = Struct.new(:success?, :expense_id, :error_message)

    RSpec.describe API do
        include Rack::Test::Methods
        let(:ledger) { instance_double('ExpenseTracker::Ledger')}

        def app 
            ExpenseTracker::API.new(ledger: ledger)
        end

        describe 'POST /expenses' do
            context 'when the expense is successfully recorded' do
                it 'returns the expense id' do
                    expense = {'ngasal'=>"asal aja"}
                    allow(ledger).to receive(:record)
                        .with(expense)
                        .and_return(RecordResult.new(true,417,nil))

                    post '/expenses', JSON.generate(expense), { 'CONTENT_TYPE' => 'application/json' }    
                    parsed = JSON.parse(last_response.body)
                    expect(parsed).to include('expense_id'=>417)
                end
                it 'respond with a 200 (OK)' do
                    expense = {'ngasal'=>"asal aja"}
                    allow(ledger).to receive(:record)
                        .with(expense)
                        .and_return(RecordResult.new(true,417,nil))
                    post '/expenses', JSON.generate(expense)    
                    expect(last_response.status).to eq(200)
                end
                    

            end
            context 'when the expense fails validation' do
                it 'returns an error message'
                it 'responds with a 422 (Unproccessable entity)'
            end
        end
    end
end