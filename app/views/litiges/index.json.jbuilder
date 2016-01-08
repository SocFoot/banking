json.array!(@litiges) do |litige|
  json.extract! litige, :id, :identifiant, :status, :motif, :transaction_id_id
  json.url litige_url(litige, format: :json)
end
