json.array!(@prerequisits) do |prerequisit|
  json.extract! prerequisit, :id, :skill_id, :prerequisit_skill_id
  json.url prerequisit_url(prerequisit, format: :json)
end
