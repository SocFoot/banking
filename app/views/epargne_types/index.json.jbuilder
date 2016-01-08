json.array!(@epargne_types) do |epargne_type|
  json.extract! epargne_type, :id, :nom, :epargne_id
  json.url epargne_type_url(epargne_type, format: :json)
end
