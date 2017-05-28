# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'ffaker'

# 100.times do |i|
#   Student.create(
#     name: FFaker::Name.name,
#     email: FFaker::Internet.email,
#     password: 'password',
#     phone: FFaker::PhoneNumber.phone_number,
#     age: (6..22).to_a[rand(16)],
#     gender: rand(2),
#     school: FFaker::Education.school,
#     school_type: User::SchoolTypes[rand(4)],
#     grade: rand(13)
#   )
# end
#
# 100.times do |i|
#   Teacher.create(
#     name: FFaker::Name.name,
#     email: FFaker::Internet.email,
#     password: 'password',
#     phone: FFaker::PhoneNumber.phone_number,
#     gender: rand(2)
#   )
# end
#
# CustomerService.create(
#   name: 'CustomerService',
#   email: 'service@gaoxiangshu.com',
#   password: 'password',
#   gender: true
# )

# teachers = Teachers.limit(10)
# Student.all.each do |stu|
#   stu.lessions.create!(
#     teacher_id: teachers[rand(11)].id,
#     courses
#   )
# end



t = Teacher.last
Course.all.each do |c|
  (5..10).to_a[rand(7)].times do |i|
    c.teachers << Teacher.find(t.id-i-rand(90))
  end
end
