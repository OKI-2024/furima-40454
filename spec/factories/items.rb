FactoryBot.define do
  factory :item do
    name                          { Faker::Commerce.product_name }
    description                   { Faker::Lorem.sentence }
    category_id                   { rand(2..12) }
    status_id                     { rand(2..7) }
    delivery_charge_id            { rand(2..3) }
    region_id                     { rand(2..48) }
    days_up_to_delivery_id        { rand(2..4) }
    price                         { rand(300..9999999) }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end



