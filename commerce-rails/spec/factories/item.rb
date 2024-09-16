FactoryBot.define do
  factory :item do
    trait :sholat do
      name {"Memaknai Sholat"}
      stock { 100 }
      price { 20000.0 }  
    end
    trait :pressman do
      name {"Pressman Software Engineering"}
      stock { 2100 }
      price { 200000.0 }  
    end
  end
end
