FactoryBot.define do
  factory :item do
    item_name {Faker::Book.title}
    message {Faker::String.random}
    price  {Faker::Number.between(from: 300, to: 9999999)}  
    category_id {Faker::Number.within(range: 2..11)}
    item_status_id {Faker::Number.within(range: 2..7)} 
    burden_id {Faker::Number.within(range: 2..3)} 
    state_id {Faker::Number.within(range: 2..48)} 
    shipping_day_id {Faker::Number.within(range: 2..4)} 
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
