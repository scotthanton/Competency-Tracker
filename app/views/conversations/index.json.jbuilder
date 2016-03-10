json.array!(@conversations) do |conversation|
  json.extract! conversation, :id, :user_id_creator, :user_id_recipient, :title, :content, :created_at
  json.url conversation_url(conversation, format: :json)
end
