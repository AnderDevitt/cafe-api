require 'bcrypt'

class Role < ApplicationRecord
    include BCrypt

    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :is_admin, presence: true

    def password
        @password ||= Password.new(password_digest)
    end
    
    def password=(new_password)
        @password = Password.create(new_password)
        self.password_digest = @password
    end
end
