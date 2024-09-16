FactoryBot.define do
  factory :shipping do
    order
    shipper
    # Anda bisa menambahkan atribut lain yang dibutuhkan jika ada
    trait :jne_kdi do
      carrier {'JNE'}
      city {'KENDARI'} 
      cost { 70000 }
    end
    
    trait :jne_palembang do
      carrier {'JNE'}
      city {'PALEMBANG'} 
      cost { 17000 }
    end
    trait :atj_palembang do
      carrier {'ANTERAJA'}
      city {'PALEMBANG'} 
      cost { 27000 }
    end
  end
end
