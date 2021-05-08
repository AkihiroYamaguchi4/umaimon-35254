FactoryBot.define do
  factory :course do
    course_title {Faker::Name.last_name}
    description { '説明' }
    price { '999999' }
    start_datetime { '2021/5/7 10:00' }
    end_datetime { '2021/5/7 13:00'  }
    after(:build) do |course|
      course.course_images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
 end
end
