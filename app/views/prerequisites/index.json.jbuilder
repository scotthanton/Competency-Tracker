json.array!(@prerequisites) do |prerequisite|
  json.extract! prerequisite, :id
  json.url prerequisite_url(prerequisite, format: :json)
end
