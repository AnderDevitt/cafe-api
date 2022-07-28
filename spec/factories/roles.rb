FactoryBot.define do
  factory :role do
    username { "MyString" }
    email { "MyString" }
    admin { false }
    password_digest { "MyString" }
  end
end
