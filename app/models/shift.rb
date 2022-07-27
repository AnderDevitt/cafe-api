class Shift < ApplicationRecord
    validates_presence_of [:date, :start, :finish]
end
