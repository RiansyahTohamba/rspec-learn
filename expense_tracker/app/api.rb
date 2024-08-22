require 'sinatra/base'
require 'json'
require_relative 'ledger'
require_relative 'kyc/dukcapil'
require 'net/http'

module ExpenseTracker
  class API < Sinatra::Base
    def initialize(ledger: Ledger.new, dukcapil: Dukcapil.new)
      @ledger = ledger
      @dukcapil = dukcapil
      super()
    end

    post '/dukcapil/text_check' do
      debitur = JSON.parse(request.body.read)
      result = @dukcapil.text_check(debitur)
      JSON.generate(
        'content' => result,
        "quotaLimiter"=> 175203
      )
    end

    post '/dukcapil/fr_check' do
      debitur = JSON.parse(request.body.read)
      result = @dukcapil.fr_check(debitur)
      JSON.generate(
        'content' => result,
        "quotaLimiter"=> 175203
      )
    end

    post '/expenses' do
      expense = JSON.parse(request.body.read)
      result = @ledger.record(expense)

      if result.success?
        JSON.generate('expense_id' => result.expense_id)
      else
        status 422
        JSON.generate('error' => result.error_message)
      end
    end

    get '/expenses/:date' do
      JSON.generate(@ledger.expenses_on(params[:date]))
    end
  end
end