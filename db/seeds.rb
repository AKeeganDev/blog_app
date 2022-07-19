# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
new_user = User.create(name: 'Test User', photo: 'www.google.com', bio: 'Student from Test Country')
for a in 1..5 do Post.create(user: new_user, title: "some title #{a+1}", text: "some text #{a+1}") end 