FactoryBot.define do
  factory :item_order do
    token           {"token"}
    postal_code     {"333-0000"}
    prefecture_id   {"3"}
    city            {"横浜"}
    block_number    {"２番地"}
    building_name   {"ダミービル555号"}
    phone_number    {"09012345678"}
  end
end
