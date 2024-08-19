require 'json'

module ExpenseTracker
    DukcapilResult = Struct.new(:status_code, :content, :error_message)
    class Dukcapil
        def initialize
        end
        def text_check  
            result = {NAME: true}
            DukcapilResult.new(200,result,nil)
        end
        def fr_check(debitur)
            result = {score: 0.8}
            DukcapilResult.new(200,result,nil)
        end
    end
end