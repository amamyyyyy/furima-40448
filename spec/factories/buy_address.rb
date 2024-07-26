FactoryBot.define do
  factory :buy_address do
    token {"tok_abcdefghijk00000000000000000"}
    code { '123-4567' }
    prefecture_id { 2 }
    city { '足立区' }
    street { '1-1-1' }
    building { '東京ハイツ' }
    phone_number  { '09012345678' }
  end
end
