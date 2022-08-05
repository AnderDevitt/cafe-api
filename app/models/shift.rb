class Shift < ApplicationRecord
    belongs_to :employee
    validates_presence_of [:date, :start, :finish]

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
            username: self.employee.username
        }
    end

    def self.find_by_employee(username)
        # get the employee object from the database
        employee = Employee.find_by(username: username)
        # return the list of shifts for that employee
        return self.where(employee: employee)
    end
    

    def self.find_by_date(date)
        # get the shift object from the database
        date = Shift.find_by(date: date)
        # return the list of shifts for a certain date
        return self.where(date: date)
    end

end
