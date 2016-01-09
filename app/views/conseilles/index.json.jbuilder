json.array!(@conseilles) do |conseille|
  json.extract! conseille, :id, :nom, :prenom, :user_id, :account_id, :transaction_id, :litige_id
  json.url conseille_url(conseille, format: :json)
end
