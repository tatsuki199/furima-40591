FactoryBot.define do
  factory :purchase_shipping_address do
    post_code { '123-4567' }
    region_id { 2 }
    municipalities { '名古屋' }
    street_address { '1-1' }
    building_name { '名古屋ハイツ' }
    telephone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
