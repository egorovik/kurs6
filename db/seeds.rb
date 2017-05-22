def rand_date
  a = 1483218000
  a += rand(31438800)
  t = Time.at(a)
  d = Date.new(t.year, t.month, t.day)
  return d
end


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

cities_arr = []
cities_arr << City.create!(name: 'Москва')
cities_arr << City.create!(name: 'Муром')
cities_arr << City.create!(name: 'Кострома')
cities_arr << City.create!(name: 'Галич')
cities_arr << City.create!(name: 'Киров')
cities_arr << City.create!(name: 'Пермь')
cities_arr << City.create!(name: 'Нижний Тагил')
cities_arr << City.create!(name: 'Екатеринбург')
cities_arr << City.create!(name: 'Тюмень')
cities_arr << City.create!(name: 'Омск')

excursion_names = []
excursion_names << "Музеи"
excursion_names << "Памятники архитектуры"
excursion_names << "Достопримечательности"
excursion_names << "Исторический центр"
excursion_names << "Парки"
excursion_names << "Выставки"

excursion_descrs = []
excursion_descrs << "Экскурсия внутри города"
excursion_descrs << "Экскурсия в области"
excursion_descrs << "Экскурсия может быть разделена на несколько дней"
excursion_descrs << "Аренда транспорта включена в стоимость"
excursion_descrs << "Пешая прогулка"
excursion_descrs << "Экскурсия на автобусе"

excursion_names.each do |n|
  Excursion.create!(name: n, price: rand(5000) + 200, city: cities_arr.shuffle.first, descr: excursion_descrs.shuffle.first)
end

route_names = []
route_names << "Северная часть города"
route_names << "Южная часть города"
route_names << "Восточная часть города"
route_names << "Западная часть города"
route_names << "Центральная часть города"
route_names << "Главные пешеходные улицы"
route_names << "Главные достопримечательности"
route_names << "Смотровые площадки"

route_descrs = []
route_descrs << "Для пеших прогулок"
route_descrs << "Для велосипедистов"
route_descrs << "Для самостоятельного посещения"
route_descrs << "Через торговые центры"

routes = []
route_names.each do |n|
  routes << Route.create!(name: n, base_price: rand(1000) + 50, descr: route_descrs.shuffle.first, city: cities_arr.shuffle.first)
end

tous_descrs = []
tous_descrs << "Для всей семьи"
tous_descrs << "Для активного отдыха"
tous_descrs << "С проживанием в отеле"

15.times do |n|
  Tour.create!(start_date: rand_date, days_in_tour: rand(20) + 1, route: routes.shuffle.first, add_price: rand(10000) + 1000, add_descr: tous_descrs.shuffle.first)
end

