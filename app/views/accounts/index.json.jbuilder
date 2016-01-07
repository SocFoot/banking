json.array!(@accounts) do |account|
  json.extract! account, :id, :zip, :libelle
  json.url account_url(account, format: :json)
end
