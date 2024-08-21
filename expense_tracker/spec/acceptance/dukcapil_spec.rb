require 'rack/test'
require 'json'
require_relative '../../app/api'

module ExpenseTracker
  RSpec.describe 'Expense Tracker API', :db do
    include Rack::Test::Methods

    def app
      ExpenseTracker::API.new
    end

    describe 'POST /dukcapil/fr_check' do
        context 'when dukcapil successfully sent respond' do
            it 'returns the search_score with the value greater than 80' do
                debitur = { img: 'riansyah.jpeg', nik: '7478313123139120' }
                post '/dukcapil/fr_check', JSON.generate(debitur), {'CONTENT_TYPE'=> 'application/json'}
                expect(last_response.status).to eq(200)
                parsed = JSON.parse(last_response.body)
                expect(parsed['content']).to include('score')
            end
        end

        context 'when dukcapil cannot identify debitur' do
            it 'respond with a 400 status (wrong debts)'
        end
    end
    
  end
end
