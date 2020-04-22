# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Resident.delete_all
Apartment.delete_all
User.delete_all


U = 10
A = 7
R = 5

user = Array.new(U)
U.times do |u|
	user[u] = User.create(
		email: "u#{u}@u.com",
		admin: u<2,
	    password: "123456",
	    password_confirmation: "123456" 
	)

	apartment = Array.new(A)
	A.times do |a|
		apartment[a] = Apartment.create(
			user: user[u],
			identifier: u.to_s + '-' +a.to_s
		)

		resident = Array.new(R)
		R.times do |r|
			resident[r] = Resident.create(
				apartment: apartment[a],
				name: Faker::Name.unique.name,
				email: Faker::Internet.email,
				telephone: (Faker::PhoneNumber.cell_phone).to_s
			)
			puts "Resident #{r}: #{resident[r].name} created!"
		end
	end
end