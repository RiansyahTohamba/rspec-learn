module ExpenseTracker
    RecordResult = Struct.new(:success?, :expense_id, :error_message)

    class Ledger
        def initialize
        end
        def record(expense)
            DB[:expenses].insert(expense)
            id = DB[:expenses].max(:id)
            RecordResult.new(true,id,nil)
        end

        def expenses_on(date)
            DB[:expenses].where(date: date).all
        end
    end
end

# allow(ledger).to receive(:record)
#     .with(expense)
#     .and_return(RecordResult.new(true,417,nil))
#
#expect(dukcapil_log).to have_received(:save).with(hash_including(
    # nik_checked: debitur[:nik_checked],
    # check_id: debitur[:check_id],
    # checker_id: debitur[:checker_id],
    # response_status: 'success'
# ))     
#
#