require 'json'
require 'net/http'
require_relative '../../../app/kyc/dukcapil'
require_relative '../../../app/kyc/dukcapil_log'

RSpec.describe 'Dukcapil KYC Unit' do
    let(:dukcapil_service) { ExpenseTracker::Dukcapil.new }
    # let(:dukcapil_log) { instance_double("ExpenseTracker::DukcapilLog")}

    describe 'FR check' do
        def request_third_data(response_body)
            uri = URI(ExpenseTracker::Dukcapil::FR_URL)
            allow(Net::HTTP).to receive(:start)
                .with(uri.hostname, uri.port, use_ssl:true)
                .and_return(double('response',body: response_body))
        end
        
        context 'when dukcapil successfully sent respond' do
            it 'returns the score of searching result' do
                response_body = { 'content' => {'status_code' => '200','score' => 0.8}}.to_json
                request_third_data(response_body)

                debitur = { 
                    nik_checked: '7471091819930218831',
                    check_id: '7471091819930218831_20240101',
                    checker_id: 'COMPANY1292',
                    created_at: Time.now
                }

                # expect(log).to eq('log has been saved')
                dukcapil_log = instance_double('ExpenseTracker::DukcapilLog')
                allow(ExpenseTracker::DukcapilLog).to receive(:new).and_return(dukcapil_log)
                allow(dukcapil_log).to receive(:save).and_return(true)
                
                result = dukcapil_service.fr_check(debitur)
                
                expect(result.success?).to be(true)
                expect(result.data).to include('score')
                
                # LogResult = Struct.new(:nik_checked, :check_id, :checker_id, :response_status)
                # log_result = ExpenseTracker::DukcapilLogResult.new
                # # verifikasi log
                # expect(dukcapil_log).to have_received(:save).with(log_result)
            end
        end

        context 'when dukcapil cannot identify debitur' do
            it 'respond with NIK is not found' do
                response_body = { 'content' => {'status_code'=> '4000','error_message' => 'Foto Tidak sesuai'}}
                request_third_data(response_body)
            end
        end
    end

    describe 'POST /dukcapil/text_check'

end