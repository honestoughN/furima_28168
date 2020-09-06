FactoryBot.define do
  factory :item do
    name               {Faker::Name.name}
    detail             {Faker::String.random}
    category_id        {Faker::Number.within(range: 2..11)}
    status_id          {Faker::Number.within(range: 2..7)}
    shipping_charge_id {Faker::Number.within(range: 2..3)}
    shipping_area_id   {Faker::Number.within(range: 2..48)}
    shipping_day_id    {Faker::Number.within(range: 2..4)}
    selling_price      {Faker::Number.within(range: 300..9999999)}
    association :user
  end

end
