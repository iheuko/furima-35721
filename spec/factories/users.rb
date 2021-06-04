FactoryBot.define do
  gimei = Gimei.name

  factory :user do
    
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = '1a' + Faker::Internet.password(min_length: 6) 
    password {password}
    password_confirmation {password}
    birthday{Faker::Date.birthday(min_age: 15, max_age: 18)}
    last_name{gimei.last.kanji}
    first_name{gimei.first.kanji}
    last_name_katakana{gimei.last.katakana}
    first_name_katakana{gimei.first.katakana}
  end
end
