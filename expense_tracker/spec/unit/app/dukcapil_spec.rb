require 'json'

RSpec.describe 'Dukcapil kyc feature' do
    include Rack::Test::Methods
    let(:dukcapil_third) { instance_double('DukcapilThirdParty')}

    def app
        ExpenseTracker::API.new(dukcapil)
    end
    describe 'POST /dukcapil/text_check'
    
    describe 'POST /dukcapil/fr_check' do
        context 'when dukcapil successfully sent respond' do
            it 'returns the search_score with the value greater than 80' do
                user = { img: 'riansyah.jpeg', nik: '7478313123139120' }
                post '/dukcapil/fr_check', JSON.generate(user), {'CONTENT_TYPE'=> 'application/json'}
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