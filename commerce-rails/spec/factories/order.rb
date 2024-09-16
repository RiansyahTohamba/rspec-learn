# spec/factories/orders.rb
FactoryBot.define do
  factory :order do

    trait :with_line_sholat_pressman do
      after(:build) do |order|
        order.line_items << create(:line_item, :line_sholat)
        order.line_items << create(:line_item, :line_pressman)
      end
    end

    trait :with_line_sholat do
      after(:build) do |order|
        order.line_items << create(:line_item, :line_sholat)
      end
    end
    trait :pending do
      status { "pending" }
    end

    trait :paid do
      status { "paid" }
    end

    trait :shipped do
      status { "shipped" }
    end
  end
end
