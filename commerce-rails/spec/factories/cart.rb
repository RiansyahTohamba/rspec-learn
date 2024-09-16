FactoryBot.define do
  factory :cart do
    trait :with_line_items do
      after(:create) do |cart|
        create_list(:line_item, 3, cart: cart)
      end
    end
  end
end
