FactoryBot.define do
  factory :purchase_record_destination do
    postal_code{Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4)}
    city{Faker::Address.city}
    block{Faker::Address.street_address}
    building{Faker::Company.name}
    phone_number{Faker::Number.leading_zero_number(digits: 11)}
    region_id{ rand(2..48) }
    token{Faker::Alphanumeric.alphanumeric(number: 30)}
    user_id { 1 }
    item_id { 1 }
    
  end
end

