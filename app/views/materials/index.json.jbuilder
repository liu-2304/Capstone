json.array!(@materials) do |material|
  json.extract! material, :id, :name, :material_type
  json.url material_url(material, format: :json)
end
