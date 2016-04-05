json.array!(@replies) do |reply|
  json.extract! reply, :id, :user_id, :content, :created_at
  json.url reply_url(reply, format: :json)
end
