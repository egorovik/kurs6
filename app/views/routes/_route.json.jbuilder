json.extract! route, :id, :name, :base_price, :city_id, :descr, :created_at, :updated_at
json.url route_url(route, format: :json)
