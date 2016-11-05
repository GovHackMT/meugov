json.extract! state, :id, :name, :acronym, :created_at, :updated_at
json.url state_url(state, format: :json)