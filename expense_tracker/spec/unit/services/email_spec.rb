# frozen_string_literal: true
require_relative '../../../app/services/email'
RSpec.describe Email  do
  let(:mail_double) { instance_double('Mail::Message')}
  
  before do
    allow(Mail).to receive(:deliver).and_return(mail_double)
  end

  it "should sends an email successfuly" do
    to = 'rianysaht93@gmail.com'
    subject = 'Using Double Mail'
    body = 'hello, this i a test mail using double'
    
    Email.send_email(to, subject, body)

    expect(Mail).to have_received(:deliver)
  end
end
