# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Member.create(name: 'wayne', email: 'wayne@wayne.com', admin_level: 0, password: "password", uid: '')
Member.create(name: 'brendo', email: 'brendo@brendo.com', admin_level: 1, password: "password", uid: '')
Member.create(name: 'fussler', email: 'fussler@fussler.com', admin_level: 2, password: "password", uid: '')

Persona.create(first_name: 'Alec', last_name: 'Simms', dob: "07-27-1985", sex: "male", race: "caucasion", member_id: 1, faction_id: 3)
Persona.create(first_name: 'Fred', last_name: 'Giguel', dob: "04-11-1975", sex: "male", race: "hispanic", member_id: 2, faction_id: '')
Persona.create(first_name: 'Alec', last_name: 'Simms', dob: "07-27-1985", sex: "male", race: "caucasion", member_id: 3, faction_id: 5)

Gun.create(serial_number: '122abc', model: 'combat pistol', description: 'woodgrain handle, black metal', persona_id: 1)
Gun.create(serial_number: '123abc', model: 'sns pistol', description: 'chrome', persona_id: 2)
Gun.create(serial_number: '124abc', model: 'Heavy pistol', description: 'pearl handle, blued', persona_id: '')


Address.create(street_name: 'fake st', street_number: '1234', zip_code: 90210, unit_type: 'apt', apt_number: 'B', has_interior?: true, persona_id: 1)
Address.create(street_name: 'Gilberth Ave', street_number: '31234', zip_code: 92310, unit_type: 'house', apt_number: '', has_interior?: true, persona_id: 1)
Address.create(street_name: 'Rombo st', street_number: '5', zip_code: 91009, unit_type: 'apt', apt_number: '1A', has_interior?: true, persona_id: 1)

Vehicle.create(year: 1976, make: 'Ford', model: 'F250', color: 'green',plate_number: '049-TEO', persona_id: 1)
Vehicle.create(year: 2020, make: 'Chevy', model: 'Silverado', color: 'blue',plate_number: '831-TRF', persona_id: 2)
Vehicle.create(year: 1996, make: 'DeClasse', model: 'Huslter', color: 'Red',plate_number: 'PIMPIN', persona_id: 3)