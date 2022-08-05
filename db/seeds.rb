# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
password = BCrypt::Password.create('password')
# Create sample shifts for DB
# if Shift.count == 0
#     s1 = Shift.create("date"=>"2022-07-25", "start"=>"06:30:00", "finish"=>"12:30:00", "employee_id" => "1")
#     s2 = Shift.create("date"=>"2022-07-25", "start"=>"09:30:00", "finish"=>"14:30:00", "employee_id" => "2")
#     s3 = Shift.create("date"=>"2022-07-27", "start"=>"06:30:00", "finish"=>"10:30:00", "employee_id" => "1")
#     s4 = Shift.create("date"=>"2022-07-27", "start"=>"10:30:00", "finish"=>"12:30:00", "employee_id" => "2")
# end

# Create sample employees for DB
if Employee.count == 0
    e1 = Employee.create("first_name"=>"Andrew", "last_name"=>"Devitt", "username"=>"andrew d", "is_active"=>"true", "password"=>"1234")
    e2 = Employee.create("first_name"=>"Raj", "last_name"=>"Ranj", "username"=>"raj r", "is_active"=>"true", "password"=>"1234")
    e3 = Employee.create("first_name"=>"Jane", "last_name"=>"Smith", "username"=>"jane s", "is_active"=>"false", "password"=>"1234")
    e4 = Employee.create("first_name"=>"Bob", "last_name"=>"Green", "username"=>"bob g", "is_active"=>"false", "password"=>"1234")
end

# Create sample roles for DB
if Role.count == 0
    r1 = Role.create("username"=>"admin", "email"=>"admin@email.com", "is_admin"=>"true", "password"=>"admin123")
    r2 = Role.create("username"=>"cafe", "email"=>"cafe@email.com", "is_admin"=>"false", "password"=>"cafe123")
end