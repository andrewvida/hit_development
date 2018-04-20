# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

tags = [
  'computers',
  'errors',
  'how-tos',
  'FAQ',
  'printers',
  'telephone',
  'cellphone',
  'wifi',
  'VPN',
  'software',
  'network',
  'conference rooms',
  'holidays',
  'schedule',
  'calendar',
  'support',
  'managers',
  'staff',
  'emergency',
  'website',
  'microsoft',
  'email',
  'outlook',
  'lunch',
  'food',
  'refrigerator',
  'meetings',
  'Hendrick U',
  'equipment',
  'furnature',
  'house rules',
  'cleanliness',
  'discount',
  'community',
  'dealerships',
  'helpdesk',
  'help',
  'projects',
  'mobile apps']

departments = [
  'Software',
  'Purchasing',
  'Operations',
  'Engineering',
  'Project Management']

departments.each do |dept|
  department = Department.create(department_name: dept,
    mission:Faker::BackToTheFuture.quote)
  department.tag_names = [tags.sample, tags.sample, tags.sample, tags.sample]
  department.save
  puts department.department_name
end

puts 'Departments created.'

50.times do |index|
  user = User.create(name: Faker::Name.unique.name,
    email:Faker::Internet.email,
    title:Faker::Job.title,
    department: Department.all.sample,
    photo_url: "https://robohash.org/#{tags.sample}",
    bio: Faker::Lorem.sentence(5))
  user.tag_names = [tags.sample, tags.sample, tags.sample, tags.sample]
  user.save
  puts user.name
end

puts '50 Users created.'

100.times do |index|
  post = Post.create(title: Faker::Lorem.sentence(1),
    details: Faker::Lorem.paragraph(8),
    post_type: [0,1,2,3,4].sample,
    user: User.all.sample,
    department: Department.all.sample)
  post.tag_names = [tags.sample, tags.sample, tags.sample, tags.sample]
  post.save
  puts post.title
end

puts '100 Posts created.'
