FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) + "12a" }
    password_confirmation { password }
    first_name_kanji      { person.first.kanji }
    last_name_kanji       { person.last.kanji }
    first_name_furigana   { person.first.katakana }
    last_name_furigana    { person.last.katakana }
    birthday              { Faker::Date.backward }
  end
end
