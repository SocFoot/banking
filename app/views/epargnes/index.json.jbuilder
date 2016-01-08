json.array!(@epargnes) do |epargne|
  json.extract! epargne, :id, :style, :libelle, :rate, :user_id
  json.url epargne_url(epargne, format: :json)
end
