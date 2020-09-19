FactoryBot.define do
  factory :item_order do
    token           {Faker::String.random}
    postal_code     {"123-4567"}
    prefecture_id   {Faker::Number.within(range: 2..48)}
    city            {Faker::String.random}
    block_number    {Faker::String.random}
    building_name   {Faker::String.random}
    phone_number    {Faker::Number.number(digits: 11)}
  end
end
