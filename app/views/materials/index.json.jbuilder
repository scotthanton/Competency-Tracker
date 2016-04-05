json.array!(@materials) do |material|
  json.extract! material, :id, :skill_id, :description, :material_to_learn, :level, :created_at, :updated_at
  json.url material_url(material, format: :json)
end
