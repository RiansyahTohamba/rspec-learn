FactoryBot.define do
  factory :line_item do
    association :cart 
    association :order

    # after(:build) do |line_item|
    #   line_item.total_price
    # end

    trait :line_sholat do
      association :item, :sholat
      quantity { 2 }
    end

    trait :line_pressman do
      association :item, :pressman
      quantity { 3 }
    end
  end
end
