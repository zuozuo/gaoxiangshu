json.extract! user, :id, :name, :email, :phone, :age, :gender, :created_at, :updated_at
json.url user_url(user, format: :json)
