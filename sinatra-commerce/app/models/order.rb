class Order
    def initialize(payment_processor)
        @payment_processor = payment_processor
    end

    def process(amount)
        @payment_processor.pay(amount)
        "Order processed successfully"
    end
end