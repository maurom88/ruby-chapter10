class User

    attr_reader :id, :logged_in, :email, :password

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

    def login(input_email = nil, input_password = nil)
        if input_email && input_password
            if input_email == @email && input_password == @password
                puts "Welcome, #{@email}!"
                @logged_in = true
            else
                puts "Incorrect email or password."
                @logged_in = false
            end
        else
            puts "Please enter email and password."
            @logged_in = false
        end
    end

    def logout
        if @email && @logged_in
            puts "Goodbye #{@email}!"
        end
    end

end

class Teacher < User

    attr_reader :language, :languages

    def initialize(email, password, languages = [])
        super(email, password)
        @languages = languages
    end

    def language=(value)
        if value == ""
            raise "Please enter a language."
        else
            @languages << value
        end
    end

    def print_languages
        p @languages
    end
end

class Employer < User
end

class Administrator < User
end


admin = Administrator.new("a", "b")
puts admin.email
puts admin.password

admin.login("a", "b")
admin.logout

teacher = Teacher.new("c", "d")
teacher.language = "English"
teacher.language = "Spanish"
teacher.print_languages