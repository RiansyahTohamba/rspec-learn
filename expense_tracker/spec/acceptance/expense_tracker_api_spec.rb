require 'rack/test'
require 'json'
require_relative '../../app/api'

module ExpenseTracker
    RSpec.describe 'Expense Tracker API' do
        include Rack::Test::Methods
        def app
            ExpenseTracker::API.new(ledger: Ledger.new)
        end
        
        def post_expense(expense)
            post '/expenses', JSON.generate(expense)
            expect(last_response.status).to eq(200)

            parsed = JSON.parse(last_response.body)
            expect(parsed).to include('expense_id' => a_kind_of(Integer))
            expense.merge('id' => parsed['expense_id'])
        end            

        it 'records submitted expenses' do
            pending 'require to persist the expenses'
            coffee = {
                'payee' => 'Starbucks',
                'amount' => 10,
                'date'=> '2014-10-02'
            }
            post_expense(coffee)
            zoo = {
                'payee' => 'Zoo',
                'amount' => 20,
                'date'=> '2024-07-02'
            }
            post_expense(zoo)

            get '/expenses/2024-10-02'
            expect(last_response.status).to eq(200)
            expenses = JSON.parse(last_response.body)
            expect(expenses).to contain_exactly(coffee,zoo)
        end

    end
end