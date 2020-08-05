FactoryBot.define do
  factory :item do
    name {Faker::Game.platform}
    description { Faker::Lorem.sentence}
    price {Faker::Number.number(digits: 5)}

    # idはfakerのナンバーがあるからそれ使う。
  end
end
