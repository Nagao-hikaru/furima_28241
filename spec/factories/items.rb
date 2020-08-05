FactoryBot.define do
  factory :item do
    name { Faker::Game.platform }
    description { Faker::Lorem.sentence }
    price { 8348 }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    category_id { Faker::Number.between(from: 2, to: 10) }
    burden_id { Faker::Number.between(from: 2, to: 3) }
    area_id { Faker::Number.between(from: 2, to: 48) }
    delivery_day_id { Faker::Number.between(from: 2, to: 4) }
    association :user
  end
end
