json.extract! user, :id, :username, :first_name, :last_name, :password, :age, :address, :role, :created_at, :updated_at
json.url user_url(user, format: :json)
