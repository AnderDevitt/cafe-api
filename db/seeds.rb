# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create sample shifts for DB
if Shift.count == 0
    s1 = Shift.create("date"=>"2022-07-25", "start"=>"06:30:00", "finish"=>"12:30:00", "hours"=>7)
    s2 = Shift.create("date"=>"2022-07-25", "start"=>"09:30:00", "finish"=>"14:30:00", "hours"=>5)
    s3 = Shift.create("date"=>"2022-07-25", "start"=>"06:30:00", "finish"=>"10:30:00", "hours"=>4)
    s4 = Shift.create("date"=>"2022-07-25", "start"=>"10:30:00", "finish"=>"12:30:00", "hours"=>2)
end