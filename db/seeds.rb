if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'admin@localhost')
  u1.activate!
end
if (u2 = User.find_by_email('user@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'user@localhost')
  u2.activate!
end
r1, r2 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)

city1 = City.create!(name: 'Город1')
city2 = City.create!(name: 'Город2')
city3 = City.create!(name: 'Город3')

excursion1 = Excursion.create!(name: 'Экскурсия1', price: 1000, city: city1, descr: "Описание1")
excursion2 = Excursion.create!(name: 'Экскурсия2', price: 2000, city: city2, descr: "Описание2")
excursion3 = Excursion.create!(name: 'Экскурсия3', price: 3000, city: city3, descr: "Описание3")

route1 = Route.create!(name: 'Маршрут1', base_price: 1000, city: city1, descr: "Описание1")
route2 = Route.create!(name: 'Маршрут2', base_price: 2000, city: city2, descr: "Описание2")
route3 = Route.create!(name: 'Маршрут3', base_price: 3000, city: city3, descr: "Описание3")

timenow = Time.now
tour1 = Tour.create!(start_date: Date.new(timenow.year, timenow.month, timenow.day), days_in_tour: 10, route: route1, add_price: 1000, add_descr: "Дополнительное описание1")
timenow += 60*60*24
tour2 = Tour.create!(start_date: Date.new(timenow.year, timenow.month, timenow.day), days_in_tour: 20, route: route2, add_price: 2000, add_descr: "Дополнительное описание2")
timenow += 60*60*24
tour3 = Tour.create!(start_date: Date.new(timenow.year, timenow.month, timenow.day), days_in_tour: 30, route: route3, add_price: 3000, add_descr: "Дополнительное описание3")
