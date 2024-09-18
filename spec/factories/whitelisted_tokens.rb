FactoryBot.define do
  factory :whitelisted_token do
    jti { "MyString" }
    user { nil }
    exp { "2024-08-28 16:42:49" }
  end
end
