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

excursion1 = Excursion.create!(name: 'Экскурсия1', price: 1000, city: city1, descr: "Описание")

route1 = Route.create!(name: 'Маршрут1', base_price: 1000, city: city1, descr: "Описание")

timenow = Time.now
tour1 = Tour.create!(start_date: Date.new(timenow.year, timenow.month, timenow.day), days_in_tour: 10, route: route1, add_price: 1000, add_descr: "Дополнительное описание")
