class User

    attr_reader :id
    attr_accessor :email, :password

    def email=(value)
        if value == ""
            raise "Email can't be blank!"
        end
        @email = value
    end

    def password=(value)
        if value == ""
            raise "Password can't be blank!"
        end
        @password = value
    end

    def initialize(email = "user@example.com", password = "xxxxxx")
        @email = email
        @password = password
    end

end

class Teacher < User
end

class Employer < User
end

class Administrator < User
end

puts Employer.new.email
puts Teacher.new.password
admin = Administrator.new("a", "b")
puts admin.email
puts admin.password