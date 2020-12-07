FactoryBot.define do
  factory :user do
    name { "MyString" }
    sequence(:email) { |n| "test#{n}@mail.com" }
    phone { "12334567" }
    send_information_status { '' }
  end
end
