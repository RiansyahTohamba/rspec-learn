require_relative '../../../app/ledger'
require_relative '../../../config/sequel'
require_relative '../../support/db'

module ExpenseTracker
    RSpec.describe Ledger, :aggregate_failures, :db do
        let(:ledger) { Ledger.new}
        let(:expense) do
            {
                'payee' => 'Starbucks',
                'amount' => 5.75,
                'date' => '2024-08-10'
            }
        end
        describe '#record' do
            context 'with a valid expense' do
                it 'successfully saves the expenses in the DB' do
                    result = ledger.record(expense)
                    expect(result).to be_success
                    expect(DB[:expenses].all).to match [a_hash_including(
                        id: result.expense_id,
                        payee: 'Starbucks',
                        amount: 5.75,
                        date: Date.iso8601('2024-08-10')
                    )]
                end
            end
            context 'with a invalid expense' do
            end
        end
    end
end