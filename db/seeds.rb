# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Create projects:
# Project.create!(name: 'Clean Garage')
# Project.create!(name: 'Paint House')

#Create lists associated with projects:
# clean_garage = Project.find_by(name: 'Clean Garage')
# paint_house = Project.find_by(name: 'Paint House')
# fall_cleaning = Project.find_by(name: 'Fall Cleaning')

# clean_garage.lists.create!(name: 'Sell Old Car')
# clean_garage.lists.create!(name: 'Yard Sale')
# paint_house.lists.create!(name: 'Choose Paint Color')
# paint_house.lists.create!(name: 'Buy Paint Supplies')
# fall_cleaning.lists.create!(name: 'Buy Leaf Blower')
# fall_cleaning.lists.create!(name: 'Drop Leaves At Dump')

#Create tasks associated with lists:
sell_old_car = List.find_by(name: 'Sell Old Car')
yard_sale = List.find_by(name: 'Yard Sale')
choose_paint = List.find_by(name: 'Choose Paint Color')
paint_supplies = List.find_by(name: 'Buy Paint Supplies')
leaf_supplies = List.find_by(name: 'Buy Leaf Blower')
leaf_dump = List.find_by(name: 'Drop Leaves At Dump')

sell_old_car.tasks.create!(name: 'Buy Kelly Blue Book', priority: 3)
sell_old_car.tasks.create!(name: 'Vacuum Trunk', priority: 4)
yard_sale.tasks.create!(name: 'Sweep Garage Floor', priority: 5)
yard_sale.tasks.create!(name: 'Recycle Boxes', priority: 3)
choose_paint.tasks.create!(name: 'Buy Swatches', priority: 2)
choose_paint.tasks.create!(name: 'Compare Color Swatches', priority: 3)
paint_supplies.tasks.create!(name: 'Buy Paint', priority: 5)
paint_supplies.tasks.create!(name: 'Buy Brushes', priority: 1)
leaf_supplies.tasks.create!(name: 'Buy Rake', priority: 3)
leaf_supplies.tasks.create!(name: 'Buy Compost Bin', priority: 4)
leaf_dump.tasks.create!(name: 'Buy Wood Chipper', priority: 2)
leaf_dump.tasks.create!(name: 'Buy Leafbags', priority: 5)
