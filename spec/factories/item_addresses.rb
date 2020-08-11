FactoryBot.define do
  factory :item_address do
    city {Faker::Address.city}
    address {Faker::Address.street_address}
    area_id {Faker::Number.between(from: 2, to: 48)}
    building {Faker::Address.building_number}
    tel { "08055555555"}
    postal_code { "452-1801" }
    token { "token" }
  end
end
