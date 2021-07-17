require_relative 'OOP'


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

teacher.eat_lunch