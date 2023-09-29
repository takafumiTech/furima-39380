FactoryBot.define do
  factory :order_address do
    postal_code    { "123-5678" }
    prefecture_id  { Faker::Number.between(from: 2, to: 48) }
    city           { Faker::Address.city }
    address        { "24" }
    building       { "アパート" }
    phone_number   { "09012345678" }
    token          { "tok_abcdefghijk00000000000000000" }
  end
end