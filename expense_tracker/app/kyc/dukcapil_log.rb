module ExpenseTracker
  DukcapilLogResult = Struct.new(:nik_checked, :check_id, :checker_id, :response_status)
  class DukcapilLog
    def save(log_result: ExpenseTracker::DukcapilLogResult.new)
       
    end
  end
end