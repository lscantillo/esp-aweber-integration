FactoryBot.define do
  factory :access_token do
    access_token { "MyText" }
    expires_in_string { "MyString" }
  end
end
