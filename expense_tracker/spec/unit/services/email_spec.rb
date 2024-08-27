require 'rack/test'
require_relative '../../../app/services/email'
require_relative '../../../app/api'
require_relative './authorized_spec'

module ExpenseTracker

RSpec.describe Email  do
  include Rack::Test::Methods
  include_context 'Auth'

  let(:mail_double) { instance_double('Mail::Message')}
  let(:ledger) { instance_double('ExpenseTracker::Ledger')}
        
  def app 
      ExpenseTracker::API.new(ledger: ledger)
  end

  before do
    allow(Mail).to receive(:deliver).and_return(mail_double)
  end
  
  describe 'POST /user/pay ' do
    it "should submit payment successfuly" do
      post '/user/pay'
      expect(Mail).to have_received(:deliver)
    end  
  end
  

  it "should sends an email successfuly" do
    to = 'rianysaht93@gmail.com'
    subject = 'Using Double Mail'
    body = 'hello, this i a test mail using double'
    
    Email.send_email(to, subject, body)

    expect(Mail).to have_received(:deliver)
  end
end
end