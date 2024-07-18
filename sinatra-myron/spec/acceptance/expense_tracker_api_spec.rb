require 'rack/test'
require 'json'

def app
    ExpenseTracker::API.new
end
module ExpenseTracker
    RSpec.describe 'Expense Tracker API' do
        include Rack::Test::Methods
        it 'records submitted expenses' do
            coffee = {
                'payee' => 'Starbucks',
                'amount' => 10,
                'date'=> '2015-10-02'
            }
            post '/expenses', JSON.generate(coffee)
        end
    end
end