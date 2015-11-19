# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = AdminUser.create(first_name: 'Admin', last_name: 'User', email: 'adminuser@email.com', username: 'adminuser', password_digest: 'password')

lifestyle = Subject.create(name: "Lifestyle", position: 1, visible: true)
