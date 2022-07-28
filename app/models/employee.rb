class Employee < ApplicationRecord
    has_secure_password
    has_many :shifts, dependent: :destroy
    validates :username, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :is_active, presence: true
end
