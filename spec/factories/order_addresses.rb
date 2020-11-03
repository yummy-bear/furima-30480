FactoryBot.define do
  factory :order_address do
    zip_code { '123-4567' }
    delivery_area_id { 2 }
    city { '東京都' }
    address_line { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09011112222' }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id { 1 }
    item_id { 1 }
  end
end
