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
  'Executive',
  'Software',
  'Purchasing',
  'Operations',
  'Engineering',
  'Project Management']

post_types = [{
  name: 'announcements',
  title: 'Important Anouncement',
  description: 'Everyone will be notified as soon as they visit the Hendrick IT website.'
}, {
  name: 'bulletin',
  title: 'Department Bulletin',
  description: 'Everyone in the Department will be notified as soon as they visit the Department pages.'
}, {
  name: 'howto',
  title: 'How-to',
  description: 'Write a brief tutorial and help your teammates troubleshoot any issue.'
}, {
  name: 'faq',
  title: 'FAQ',
  description: 'Avoid answering the same questions by adding the most common ones here.'
}, {
  name: 'job',
  title: 'Job Post',
  description: "Have a position you'd like to promote internally? Post it here to see who will step up."
}, {
  name: 'blog',
  title: 'Department Update',
  description: 'Anything interesting happening in your department? Write a brief post to let everyone know about it.'
}, {
  name: 'linkto',
  title: 'Links & Forms',
  description: 'Gather and share resources like URLs and forms.'
}]




# Create Departments
# -------------------------------
departments.each do |dept|
  department = Department.create!( name: dept,
                                   department_head: nil,
                                   mission:Faker::BackToTheFuture.quote )
  department.tag_names = [tags.sample, tags.sample, tags.sample, tags.sample]
  department.save!

  puts department.name
end

puts 'Departments created.'

# Create Users
# -------------------------------
100.times do |index|
  user = User.create!( name: Faker::Name.unique.name,
                       email:Faker::Internet.email,
                       title:Faker::Job.title,
                       department: Department.all.sample,
                       photo_url: "https://robohash.org/#{tags.sample}",
                       bio: Faker::Lorem.sentence(5))
  user.tag_names = [tags.sample, tags.sample, tags.sample, tags.sample]
  user.save!
  puts user.name
end

puts '100 Users created.'

# Assign department heads
# -------------------------------

Department.all.each do |dept|
  dh = dept.users.all.sample
  dh.department_head = true
  dh.save!
end

puts 'Assigned all department heads'

# Create Post Types
# -------------------------------
post_types.each do |pt|
  post_type = PostType.create!(name: pt[:name], title: pt[:title], description: pt[:description])
  puts post_type.name
end

puts 'PostTypes created.'

# Create Posts
# -------------------------------
# 100.times do |index|
#   post = Post.create!( title: Faker::Lorem.sentence(1),
#                        summary: Faker::Lorem.paragraph(4),
#                        body: Faker::Lorem.paragraph(8),
#                        post_type_id: PostType.all.sample.id,
#                        author: User.all.sample,
#                        image_url: nil,
#                        action_url: nil,
#                        expiration_date: nil,
#                        department: Department.all.sample)
#   post.tag_names = [tags.sample, tags.sample, tags.sample, tags.sample]
#   post.save!
#   puts post.title
# end

# puts '100 Posts created.'

# Edit Permissions
# -------------------------------

100.times do |index|
  EditPermission.create!(user: User.all.sample, department: Department.all.sample, post_type: PostType.all.sample)
end

puts '100 Permissions created.'
