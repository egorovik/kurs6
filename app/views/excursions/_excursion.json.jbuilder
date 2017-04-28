json.extract! excursion, :id, :name, :price, :city_id, :descr, :created_at, :updated_at
json.url excursion_url(excursion, format: :json)
