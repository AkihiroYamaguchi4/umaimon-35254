FactoryBot.define do
  factory :course do
    chef_nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password { 'a1' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    chef_family_name { '佐藤' }
    chef_first_name { '太郎' }
    chef_birth_id { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
    belong { 'ホテル' }
    chef_career { 'シェフとして勤務' }
    chef_phone_number { '08011111111' }
    after(:build) do |chef|
      chef.avatar.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
 end
end
