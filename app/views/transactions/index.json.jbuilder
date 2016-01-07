json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :in, :out, :libelle, :account_id
  json.url transaction_url(transaction, format: :json)
end
