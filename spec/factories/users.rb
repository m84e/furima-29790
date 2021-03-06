FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {"abc@gmail.com"}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name_kanji     {"山田"}
    first_name_kanji      {"太郎"}
    family_name_kana      {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birthday              {"2000-01-01"}
  end
end
