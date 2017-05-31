# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'ffaker'

100.times do |i|
  Student.create(
    name: FFaker::Name.name,
    email: FFaker::Internet.email,
    password: 'password',
    phone: FFaker::PhoneNumber.phone_number,
    age: (6..22).to_a[rand(16)],
    gender: rand(2),
    school: FFaker::Education.school,
    school_type: User::SchoolTypes[rand(4)],
    grade: rand(13)
  )
end

Student.first.update(email: 'student@gaoxiangshu.com')

20.times do |i|
  Teacher.create(
    name: FFaker::Name.name,
    email: FFaker::Internet.email,
    password: 'password',
    phone: FFaker::PhoneNumber.phone_number,
    gender: rand(2)
  )
end
Teacher.first.update(email: 'teacher@gaoxiangshu.com')

CustomerService.create(
  name: 'CustomerService',
  email: 'service@gaoxiangshu.com',
  password: 'password',
  gender: true
)

10.times { |i| Course.create( name: "高橡树课程#{i}", length: rand(4..8)*10) }

# teachers = Teachers.limit(10)
# Student.all.each do |stu|
#   stu.lessions.create!(
#     teacher_id: teachers[rand(11)].id,
#     courses
#   )
# end



s = Student.last
Course.all.each do |c|
  (5..10).to_a[rand(6)].times do |i|
    c.students << Student.find(s.id-i-rand(90))
  end
end
