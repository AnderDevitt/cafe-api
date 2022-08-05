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
            last_name: self.employee.last_name
            employee_id: self.employee.id
        }
    end

end
