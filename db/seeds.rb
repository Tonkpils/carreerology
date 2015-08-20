# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
job = Job.create!(name: "Software Engineer", description: "Best job ever!")
Job.create!(name: "Account Executive", description: "Another cool job")

job.application_forms.create!(name: "Leo Correa", email: "leo@correa.com", address: "123 abc street", phone_number: "1113334444")
job.application_forms.create!(name: "Leo Correa", email: "leo+1@correa.com", address: "124 abc street", phone_number: "1113334444")
job.application_forms.create!(name: "Leo Correa", email: "leo+2@correa.com", address: "125 abc street", phone_number: "1113334444")
job.application_forms.create!(name: "Leo Correa", email: "leo+3@correa.com", address: "126 abc street", phone_number: "1113334444")
