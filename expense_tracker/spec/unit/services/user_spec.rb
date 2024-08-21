require 'net/http'
require 'json'
RSpec.describe 'User spec' do
  let(:dukcapil_third_data) { instance_double('ExpenseTracker::DukcapilThirdData')}
  let(:bpjs_third_data) {instance_double('ExpenseTracker::BpjsThirdData')}
  let(:motor_credit_bureau) {instance_double('ExpenseTracker::MotorCreditBureau')}
  let(:mortgage_credit_bureau) {instance_double('ExpenseTracker::MortgageCreditBureau')}
  
  KycCheckResult = Struct.new(:success?)

  describe 'User KYC Check' do
    context 'dukcapil check' do
      let(:debitur) { { 
        nik_checked: 'katanya sembarang aja',
      } }
      
      before do
        allow(dukcapil_third_data).to receive(:fr_check)
          .with(debitur)
          .and_return(KycCheckResult.new(true))
        allow(dukcapil_third_data).to receive(:text_check)
          .with(debitur)
          .and_return(KycCheckResult.new(true))
      end

      def request_third_data(response_body)
        uri = URI('https://api.dukcapil.com/check')

        allow(Net::HTTP).to receive(:start)
          .with(uri.hostname, uri.port, use_ssl: true)
          .and_return(double('response', body: response_body))
      end

      it 'should pass dukcapil fr check' do
        response_body = { 'content' => 
          {'status_code' => '200','score' => 0.8}
        }.to_json
        request_third_data(response_body)
        dukcapil_third_data.fr_check(debitur)
      end

      it 'should pass dukcapil text check' do
        response_body = { 'content' => 
          {'status_code' => '4000','message' => 'Foto tidak ditemukan'}
        }.to_json
        request_third_data(response_body)
        dukcapil_third_data.text_check(debitur)
      end
    end

    context 'bpjstk check' do
      
    end
    context 'motor credit bureau check' do
      
    end
    context 'mortgage credt bureau check' do
      
    end
    
  end
end