require 'json'
require 'ostruct'

module ExpenseTracker
    DukcapilResult = Struct.new(:status_code, :content, :error_message)

    class Dukcapil
        FR_URL = 'https://api.dukcapil.go.id/fr_check'
        
        def initialize()
        end
        

        def fr_check(debitur)
            uri = URI(FR_URL)
            request = Net::HTTP::Post.new(uri)
            request['Content-Type'] = 'application/json'
            request.body = { nik: debitur[:nik] }.to_json
        
            response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
              http.request(request)
            end
            
            parsed_response = JSON.parse(response.body)

            if parsed_response['content'] && parsed_response['content']['score']
                log_record(debitur)
                OpenStruct.new(success?: true, data: parsed_response['content'])
            else
                OpenStruct.new(success?: false, error_message: 'verification failed')
            end
        end


        def log_record(debitur)
            DB[:dukcapil_log].insert(debitur[:nik])
        end

        
        def text_check  
            result = {NAME: true}
            DukcapilResult.new(200,result,nil)
        end

    end
end