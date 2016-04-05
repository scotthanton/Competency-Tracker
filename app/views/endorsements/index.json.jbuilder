json.array!(@endorsements) do |endorsement|
  json.extract! endorsement, :id
  json.url endorsement_url(endorsement, format: :json)
end
