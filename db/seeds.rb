# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
##### creando redes de prueba ########
#@network = Network.create(network_name: "prueba pro")
#@network2 = Network.create(network_name: "prueba")
###### creando usuarios de prueba ##########
#@user1 = User.create(email: 'prueaba1@mail.com', role: 'admin', network_name: 'prueba pro', type_network: 'pro' )
#@user2 = User.create(email: 'prueaba2@mail.com', role: 'admin', network_name: 'prueba', type_network: 'free' )
#@user3 = User.create(email: 'prueaba3@mail.com', role: 'teacher', network_name: 'prueba pro', type_network: 'pro' )
#@user4 = User.create(email: 'prueaba4@mail.com', role: 'teacher', network_name: 'prueba', type_network: 'free' )
#@user5 = User.create(email: 'prueaba5@mail.com', role: 'student', network_name: 'prueba pro', type_network: 'pro' )
#@user6 = User.create(email: 'prueaba6@mail.com', role: 'student', network_name: 'prueba', type_network: 'free' )
###### creando admin ######
@admin = UserAdmin.create(email: 'alfredo@cursa.me', password: 'alfredo2008')