require 'json'
require 'ostruct'

module ExpenseTracker
    BpjsTkResult = Struct.new(:status_code, :content, :error_message)

    class BpjsTk
        FR_URL = 'https://api.BpjsTk.go.id/verify'
        
        def initialize()
        end
        

        def verify(debitur)
            uri = URI(FR_URL)
        end


    end
end