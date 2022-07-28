FactoryBot.define do
  factory :employee do
    first_name { "MyString" }
    last_name { "MyString" }
    username { "MyString" }
    is_active { false }
    password_digest { "MyString" }
  end
end
