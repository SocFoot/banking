json.array!(@users) do |user|
  json.extract! user, :id, :nom, :prenom, :sexe, :adresse
  json.url user_url(user, format: :json)
end
