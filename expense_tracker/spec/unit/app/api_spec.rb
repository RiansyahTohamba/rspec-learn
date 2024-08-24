require 'rack/test'
require 'json'
require_relative '../../../app/api'
require_relative '../../../app/services/ledger'

module ExpenseTracker

    RSpec.describe API do
        include Rack::Test::Methods
        let(:ledger) { instance_double('ExpenseTracker::Ledger')}
        
        def app 
            ExpenseTracker::API.new(ledger: ledger)
        end

        describe 'POST /expenses' do
            context 'when the expense is successfully recorded' do
                # arrange (setup)
                let(:expense) { {'ngasal'=>"asal aja"} }
                before do
                    allow(ledger).to receive(:record)
                        .with(expense)
                        .and_return(RecordResult.new(true,417,nil))
                end

                it 'returns the expense id' do
                    # act
                    post '/expenses', JSON.generate(expense), { 'CONTENT_TYPE' => 'application/json' }    
                    parsed = JSON.parse(last_response.body)
                    # assert
                    expect(parsed).to include('expense_id'=>417)
                end
                it 'respond with a 200 (OK)' do
                    post '/expenses', JSON.generate(expense), { 'CONTENT_TYPE' => 'application/json' }    
                    expect(last_response.status).to eq(200)
                end
            end

            context 'when the expense fails validation' do
                # arrange (setup)
                let(:expense) { {'ngasal'=>"asal aja"} }
                before do
                    allow(ledger).to receive(:record)
                        .with(expense)
                        .and_return(RecordResult.new(false,417,'Expense Incomplete'))
                end
                it 'returns an error message' do
                    post '/expenses', JSON.generate(expense), { 'CONTENT_TYPE' => 'application/json' }    
                    parsed = JSON.parse(last_response.body)
                    expect(parsed).to include('error'=>'Expense Incomplete')
                end

                it 'responds with a 422 (Unproccessable entity)' do
                    post '/expense'
                end
            end
        end

        describe 'GET /expenses/:date' do
            context '' do
            end
            context '' do
            end
        end
    end
end