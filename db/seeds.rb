# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create sample shifts for DB
if Shift.count == 0
    s1 = Shift.create("date"=>"2022-07-25", "start"=>"06:30:00", "finish"=>"12:30:00")
    s2 = Shift.create("date"=>"2022-07-25", "start"=>"09:30:00", "finish"=>"14:30:00")
    s3 = Shift.create("date"=>"2022-07-25", "start"=>"06:30:00", "finish"=>"10:30:00")
    s4 = Shift.create("date"=>"2022-07-25", "start"=>"10:30:00", "finish"=>"12:30:00")
end

# Create sample employees for DB
if Employee.count == 0
    e1 = Employee.create("first_name"=>"Andrew", "last_name"=>"Devitt", "username"=>"andrew d", "is_active"=>"true", "password_digest"=>"123456")
    e2 = Employee.create("first_name"=>"Raj", "last_name"=>"Ranj", "username"=>"raj r", "is_active"=>"true", "password_digest"=>"123456")
    e3 = Employee.create("first_name"=>"Jane", "last_name"=>"Smith", "username"=>"jane s", "is_active"=>"true", "password_digest"=>"123456")
    e4 = Employee.create("first_name"=>"Bob", "last_name"=>"Green", "username"=>"bob g", "is_active"=>"true", "password_digest"=>"123456")
    e5 = Employee.create("first_name"=>"Adam", "last_name"=>"Away", "username"=>"adam a", "is_active"=>"false", "password_digest"=>"123456")
    e6 = Employee.create("first_name"=>"Greg", "last_name"=>"Gone", "username"=>"greg g", "is_active"=>"false", "password_digest"=>"123456")
end

# Create sample roles for DB
if Employee.count == 0
    e1 = User.create("username"=>"admin", "email"=>"admin@email.com", "is_admin"=>"true", "password_digest"=>"123456")
    e2 = User.create("username"=>"cafe", "email"=>"cafe@email.com", "is_admin"=>"true", "password_digest"=>"123456")
end

# Create sample users for DB
# if User.count == 0
#     u1 = User.create("first_name"=>"Andrew", "last_name"=>"Devitt", "username"=>"andrew d", "pin"=>"1111", "is_active"=>"true", "is_admin"=>"true")
#     u2 = User.create("first_name"=>"Raj", "last_name"=>"Ranj", "username"=>"raj r", "pin"=>"1111", "is_active"=>"true", "is_admin"=>"true")
#     u3 = User.create("first_name"=>"Jane", "last_name"=>"Smith", "username"=>"jane s", "pin"=>"1111", "is_active"=>"true", "is_admin"=>"false")
#     u4 = User.create("first_name"=>"Bob", "last_name"=>"Green", "username"=>"bob g", "pin"=>"1111", "is_active"=>"true", "is_admin"=>"false")
#     u5 = User.create("first_name"=>"Adam", "last_name"=>"Away", "username"=>"adam a", "pin"=>"1111", "is_active"=>"false", "is_admin"=>"false")
#     u6 = User.create("first_name"=>"Greg", "last_name"=>"Gone", "username"=>"greg g", "pin"=>"1111", "is_active"=>"false", "is_admin"=>"false")
# end


