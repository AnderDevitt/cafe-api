FactoryBot.define do
  factory :employee do
    first_name { "MyString" }
    last_name { "MyString" }
    sequence(:username) { |n| "Caspian Star #{n}" }
    is_active { false }
    is_admin { false }
    password { "MyString" }
    email { "MyString" }
  end
end

# Example of an employee beinmg created
# "first_name"=>"admin", "last_name"=>"admin", "username"=>"admin", "is_active"=>"false", "email"=>"admin@email.com", "is_admin"=>"true", "password"=>"admin123"