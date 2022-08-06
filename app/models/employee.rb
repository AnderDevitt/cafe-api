require 'bcrypt'
class Employee < ApplicationRecord
    include BCrypt
    
    has_secure_password
    has_many :shifts, dependent: :destroy
    validates :username, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :is_active, presence: true

    def transform_employee
        return {
            id: self.id,
            first_name: self.first_name,
            last_name: self.last_name,
            username: self.username,
            is_active: self.is_active,
        }
    end

    def password
        @password ||= Password.new(password_digest)
    end
    
    def password=(new_password)
        @password = Password.create(new_password)
        self.password_digest = @password
    end
end
