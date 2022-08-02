class Shift < ApplicationRecord
    belongs_to :employee
    validates_presence_of [:date, :start, :finish]

    def transform_shift
        return {
            id: self.id,
            date: self.date,
            start: self.created_at,
            finish: self.updated_at,
            clocked_out: self.clocked_out,
            first_name: self.employee.first_name,
            last_name: self.employee.last_name
        }
    end

end
