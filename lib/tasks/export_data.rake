namespace :export do
    desc "Prints Role.all in a seeds.rb way."
    task :seeds_format => :environment do
      Role.order(:id).all.each do |role|
        puts "Role.create(#{role.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
      end
    end
  
    task :seeds_format => :environment do
      Employee.order(:id).all.each do |employee|
        puts "Employee.create(#{employee.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
      end
    end
  
    task :seeds_format => :environment do
      Shift.order(:id).all.each do |shift|
        puts "Shift.create(#{shift.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
      end
    end
  
     
    
  
    
  
  
  end