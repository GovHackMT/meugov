json.extract! city, :id, :state_id, :name, :population, :pib, :created_at, :updated_at
json.url city_url(city, format: :json)