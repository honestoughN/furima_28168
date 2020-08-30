FactoryBot.define do
  factory :user do
    nickname              {}
    email                 {}
    password              {}
    password_confirmation {password}
    first_name            {}
    last_name             {}
    first_name_kana       {}
    last_name_kana        {}
    date_of_birth         {}
  end
end