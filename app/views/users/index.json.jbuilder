json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :remember_token, :password, :security_level
  json.url user_url(user, format: :json)
end
