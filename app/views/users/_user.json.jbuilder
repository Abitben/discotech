json.extract! user, :id, :first_name, :last_name, :adress, :zip_code, :city_name, :country, :phone, :created_at, :updated_at
json.url user_url(user, format: :json)
