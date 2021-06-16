FactoryBot.define do
  factory :residence do
    state_id {Faker::Number.within(range: 2..48)} 
    city {Faker::Address.city}
    address_line {Faker::Address.street_address}
    postal_code {'123-4567'}
    phone_number {Faker::Number.number(digits: 11)} 
    building_name {'高層マンション'}
    association :order
  end
end
