FactoryBot.define do
  factory :shift do
    date { "06/08/2022" }
    start { "06:30:00" }
    finish { "12:30:00" }
    employee_id { 1 }
  end
end

# Example of a shift being created
# Shift.create("date"=>"06/08/2022", "start"=>"06:30:00", "finish"=>"12:30:00", "employee_id" => "1"