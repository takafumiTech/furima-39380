FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number:2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length:6)}
    password_confirmation {password}
    first_name_kanji      {"佐藤"}
    last_name_kanji       {"太郎"}
    first_name_furigana   {"サトウ"}
    last_name_furigana    {"タロウ"}
    birthday              {"2000-01-01"}
  end
end