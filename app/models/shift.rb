class Shift < ApplicationRecord
    belongs_to :employee
    validates_presence_of [:date, :start, :finish]

    # determine the data format
    def transform_shift
        return {
            id: self.id,
            date: self.date,
            start: self.start,
            finish: self.finish,
            clocked_out: self.clocked_out,
            first_name: self.employee.first_name,
            last_name: self.employee.last_name,
            employee_id: self.employee.id,
            created: self.created_at
        }
    end

    def self.find_by_employee(username)
        # get the employee object from the database
        employee = Employee.find_by(username: username)
        # return a list of shifts for a given employee
        return self.where(employee: employee) 
    end
end
