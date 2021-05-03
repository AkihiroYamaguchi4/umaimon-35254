FactoryBot.define do
  factory :user do
    user_nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password { 'a1' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    user_family_name { '佐藤' }
    user_first_name { '太郎' }
    user_birth_id { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
      end
end
