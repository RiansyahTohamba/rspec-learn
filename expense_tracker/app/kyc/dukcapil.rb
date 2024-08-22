require 'json'
require 'ostruct'
require_relative '../../config/sequel'

module ExpenseTracker
    DukcapilResult = Struct.new(:status_code, :content, :error_message)

    class Dukcapil
        FR_URL = 'http://localhost:4300/dukcapil/fr_check'

        def initialize()
        end
        

        def fr_check(debitur)
            uri = URI('http://localhost:4300')
            hostname = uri.hostname 
            uri.path = '/dukcapil/fr_check'
            req = Net::HTTP::Post.new(uri) 
            req.body = "{'nik': #{debitur['nik']}}"
            req.content_type = 'application/json'
            res = Net::HTTP.start(hostname,uri.port) do |http|
                http.request(req)
            end
            
            parsed_response = JSON.parse(res.body)
            if parsed_response['content']
                log_record(debitur)
                parsed_response['content']
            else
                {error_message: 'verification failed'}
            end
        end

        # notes
        # DB[:dukcapil_log].insert(check_id: '12823810', created_at: Time.now, nik_checked: '7471081299328172381')
        # DB[:dukcapil_log].all
        def log_record(debitur)
            DB[:dukcapil_log].insert(check_id: "DUK#{Time.now.to_i}",
                created_at: Time.now, nik_checked: debitur['nik'])
        end

        
        def text_check(debitur)  
            {
                "NAMA": "Sesuai (100)",
                "TEMPAT_LAHIR": "Sesuai (100)",
                "TANGGAL_LAHIR": "Tidak Sesuai",
                "ALAMAT": "Tidak Sesuai (0)",
                "NIK": "Sesuai"
            }
        end

    end
end