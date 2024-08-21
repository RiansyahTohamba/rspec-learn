module ExpenseTracker
  RSpec.describe 'Order Spec' do
    let(:user) { instance_double('ExpenseTracker::User')}
    let(:order) { instance_double('ExpenseTracker::Order') }
    let(:orders) { [{item_id: 'SKU12818',price:20},{item_id: 'SKU12818',price:10}] }

    OrderCreationResult = Struct.new(:success?, :order_id)
    UserResult = Struct.new(:id, :name)

    before do
      allow(order).to receive(:create)
        .with(:orders)
        .and_return(OrderCreationResult.new(true,117))        
      
      allow(user).to receive(:find_by_id)
        .with(:id)
        .and_return(UserResult)
    end

    describe 'create orders' do
      before do
        allow(user).to receive(:kyc_verify).and_return(true)  
      end
    end
  
    describe 'associations' do
    end
    
    describe 'validations' do
    end
  
    describe '#total_price' do
      context 'when the order has multiple items' do
        # it 'calculates the total price correctly' do
        #   allow(ledger).to receive(:record)
        #       .with(expense)
        #       .and_return(OrderCreationResult.new(true,417))
  
        # end
      end
      context 'when the order has no items' do
      end
  
    end
    describe '#mark_as_paid!' do
      context 'when the order status is pending' do
        # it 'changes the status of the order to paid'
      end
    end
  end  
end
