# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Task.create(description: 'First Task', completed: false, due_date: "2014-12-19")
Task.create(description: 'Second Task', completed: true)
Task.create(description: 'Third Task', completed: false)
Task.create(description: 'Fourth Task', completed: true, due_date: "2014-12-19")
Task.create(description: 'Fifth Task', completed: false, due_date: "2014-12-19")
