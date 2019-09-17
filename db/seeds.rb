puts "Destroying all users"
User.destroy_all
puts "Users : destroyed"

puts "destroying all bookings"
Booking.destroy_all
puts "Bookings : destroyed"

puts "Destroying all flats"
Flat.destroy_all
puts "Flats : destroyed"

puts "Seeding users"
alexandre  = User.create!(first_name: 'Alexandre',  last_name: 'Bouvier',   email: 'alexandre@gmail.com',  password: '123456')
philippine = User.create!(first_name: 'Philippine', last_name: 'Bouton',    email: 'philippine@gmail.com', password: '123456')
maxime     = User.create!(first_name: 'Maxime',     last_name: 'Personnic', email: 'maxime@gmail.com',     password: '456789')
mathieu    = User.create!(first_name: 'Mathieu',    last_name: 'Nicolas',   email: 'mathieu@gmail.com',    password: '456789')

puts "Users ok !"

puts "Seeding flats"
alexandre_flat = Flat.create(
  user:        alexandre,
  address:     "20 rue des Abbesses, 75018 Paris",
  surface:     120,
  price:       250,
  room:        4,
  description: "L'appartement se trouve au cœur du quartier de la butte Montmartre, avec ses ruelles pleines de charme, sa fameuse basilique avec vue imprenable sur la plus belle ville du monde et cette ambiance indescriptible dans une animation permanente qui en fait l'un des endroits les plus typique de notre fabuleuse capitale. L'appartement se trouve au cœur du quartier de la butte Montmartre, avec ses restos délicieux, ses ruelles pleines de charme, sa fameuse basilique avec vue imprenable sur la plus belle ville du monde et cette ambiance indescriptible dans une animation permanente qui en fait l'un des endroits les plus typique de notre fabuleuse capitale.",
  max_guests:  8,
  )
alexandre_flat.images.attach(io: File.open("app/assets/images/alexandre_flat.jpeg"), filename: 'alexandre_flat.jpeg', content_type: 'image/jpeg')


philippine_flat = Flat.create(
  user:         philippine,
  address:      "16 villa Gaudelet, 75011 Paris",
  surface:      60,
  price:        155,
  room:         2,
  description:  "Près du centre de Paris en 10 mn en métro ou bus, 20 minutes à pieds pour le Marais. Commerces et Métro Parmentier L3 au pied de l'immeuble. Bus 96 qui traverse le marais, Chatelet, Quartier latin, Luxembourg, Montparnasse. 10 à 20 mn des Gares. Deux pièces SDB, une chambre un lit double, cuisine, entrée, wc. (une troisième pièce est fermée d'accès). Pour les allergiques, un chat vit le reste du temps ici. je vous enverrai par mail une notice.",
  max_guests:   4,
  )
philippine_flat.images.attach(io: File.open("app/assets/images/philippine_flat.jpeg"), filename: 'image_name.jpeg', content_type: 'image/jpeg')
philippine_flat.images.attach(io: File.open("app/assets/images/alexandre_flat.jpeg"), filename: 'alexandre_flat.jpeg', content_type: 'image/jpeg')

maxime_flat = Flat.create(
  user:         maxime,
  address:      "176 rue de l'Université, 75007 Paris",
  surface:      40,
  price:        150,
  room:         2,
  description:  "Votre espace 2 pièces 40m2, tout le 2e étage d'un immeuble de 1830, chambre sur cour, cuisine équipée, table à manger, salon avec poutres apparentes, home-cinema 55' et canapé lit 2 places, douche à l'italienne.",
  max_guests:   2,
  )
maxime_flat.images.attach(io: File.open("app/assets/images/maxime_flat.jpeg"), filename: 'image_name.jpeg', content_type: 'image/jpeg')


mathieu_flat = Flat.create(
  user:         mathieu,
  address:      "30 rue Lhomond, 75005 Paris",
  surface:      35,
  price:        200,
  room:         1,
  description:  "Appartement entier de 35 m2 situé au 1er étage sur cour dans le 5ème arrondissement de Paris, à côté de la rue Mouffetard, au coeur du quartier latin. Calme, lumineux et charmant avec poutres apparentes et baies vitrées.",
  max_guests:   2,
  )
mathieu_flat.images.attach(io: File.open("app/assets/images/mathieu_flat.jpeg"), filename: 'mathieu_flat.jpeg', content_type: 'image/jpeg')

puts "flats ok !"

puts "Seeding bookings"
first_booking = Booking.create(
  start_date: '2019-08-10',
  end_date:   '2019-08-25',
  user:       philippine,
  flat:       alexandre_flat,
  )

second_booking = Booking.create(
  start_date:  '2019-11-01',
  end_date:    '2019-11-04',
  user:        philippine,
  flat:        maxime_flat,
  )


third_booking = Booking.create(
  start_date: '2019-07-25',
  end_date:   '2019-07-30',
  user:       philippine,
  flat:       mathieu_flat,
  )

fourth_booking = Booking.create(
  start_date:  '2019-07-10',
  end_date:    '2019-07-12',
  user:        alexandre,
  flat:        maxime_flat,
  )

fifth_booking = Booking.create(
  start_date: '2019-09-10',
  end_date:   '2019-09-12',
  user:       alexandre,
  flat:       mathieu_flat,
  )

sixth_booking = Booking.create(
  start_date: '2019-12-23',
  end_date:   '2019-12-27',
  user:       alexandre,
  flat:       philippine_flat,
  )

puts "Bookings added"
puts "all done !"
