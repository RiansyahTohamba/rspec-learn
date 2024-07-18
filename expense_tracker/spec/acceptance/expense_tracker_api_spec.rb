require 'rack/test'
require 'json'
require_relative '../../app/api'

module ExpenseTracker
    RSpec.describe 'Expense Tracker API' do
        include Rack::Test::Methods
        def app
            ExpenseTracker::API.new
        end

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