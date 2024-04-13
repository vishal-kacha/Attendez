# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create an admin user
admin_email = 'admin@example.com'
admin_password = 'password'
Admin.create!(email: admin_email, password: admin_password, password_confirmation: admin_password)

# Create a branch
branch = Branch.create!(name: 'cs')

# Create subjects (assuming 7 subjects)
subjects_data = [
  { subject_name: 'Java', branch_id: 1},
  { subject_name: 'R', branch_id:  1},
]

subjects_data.each do |subject_attrs|
  Subject.create!(subject_attrs)
end


# Create teachers (assuming 2 teachers)
teacher1 = Teacher.create!(email: 'teacher1@gmail.com', password: "teacher", branch_id: 1, subject_id: 1)
teacher2 = Teacher.create!(email: 'teacher2@gmail.com', password: "teacher", branch_id: 1, subject_id: 2)

# Create students (assuming 5 students)
students_data = [
  { email: 'student1@example.com', password: "student", branch_id: 1 },
  { email: 'student2@example.com', password: "student", branch_id: 1 },
  { email: 'student3@example.com', password: "student", branch_id: 1 },
  { email: 'student4@example.com', password: "student", branch_id: 1 },
  { email: 'student5@example.com', password: "student", branch_id: 1 }
]

students_data.each do |student_attrs|
  Student.create!(student_attrs)
end

Attendance.create(subject_id: 1, student_id: 1, status: true)
Attendance.create(subject_id: 2, student_id: 1, status: true)

Attendance.create(subject_id: 1, student_id: 2, status: true)
Attendance.create(subject_id: 2, student_id: 2, status: true)

Attendance.create(subject_id: 1, student_id: 3, status: true)
Attendance.create(subject_id: 2, student_id: 3, status: true)

Attendance.create(subject_id: 1, student_id: 4, status: true)
Attendance.create(subject_id: 2, student_id: 4, status: true)

Attendance.create(subject_id: 1, student_id: 5, status: true)
Attendance.create(subject_id: 2, student_id: 5, status: true)
