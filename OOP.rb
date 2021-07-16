class User

    attr_reader :id, :logged_in, :email, :password, :test_array

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

    def initialize(email = "user@example.com", password = "xxxxxx", test_array = [1, 2, 3, 4])
        @email = email
        @password = password
        @test_array = test_array
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

    def print_test_array
        print "Test array: "
        test_array.each { |test_value| print("#{test_value} ") }
        print "\n"
    end

    def remove_last_test_array_value(email)
        @test_array.pop
        print "New array for #{@email}: "
        p @test_array
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
        print "Teacher languages: "
        p @languages
    end
end

class Employer < User

    attr_reader :employees

    def initialize(email, password, employees = [])
        super(email, password)
        @employees = employees
    end

    def employees=(value)
        if value == ""
            raise "Please enter an employess name."
        else
            @employees << value
        end
    end
end

class Administrator < User

    attr_reader :rights

    def initialize(email, password, rights = ["read", "write"])
        super(email, password)
        @rights = rights
    end

    def print_rights
        print "Adming rights: "
        p @rights
    end
end

puts " --- "

admin = Administrator.new("admin@website.com", "adminpass")
admin.login("admin@website.com", "adminpass")
admin.print_rights
admin.print_test_array
admin.logout

puts " --- "

teacher = Teacher.new("teacher@website.com", "teacherpass")
teacher.login("admin@website.com", "adminpass")
teacher.login("teacher@website.com", "teacherpass")
teacher.language = "English"
teacher.language = "Spanish"
teacher.print_languages
teacher.print_test_array

puts " --- "

admin.remove_last_test_array_value(admin.email)
teacher.remove_last_test_array_value(teacher.email)

puts " --- "