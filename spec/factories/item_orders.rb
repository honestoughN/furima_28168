FactoryBot.define do
  factory :item_order do
    number          {"4242424242424242"}
    cvc             {"123"}
    exp_month       {"12"}
    exp_year        {"99"}
    postal_code     {"333-0000"}
    prefecture_id   {"3"}
    city            {"横浜"}
    block_number    {"２番地"}
    building_name   {"ダミービル555号"}
    phone_number    {"09012345678"}
  end
end
