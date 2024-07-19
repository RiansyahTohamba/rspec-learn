require 'sinatra/base'
require 'json'
module ExpenseTracker
    class API < Sinatra::Base
        post '/expenses' do
            JSON.generate("expense_id"=>12)
        end

    end
end