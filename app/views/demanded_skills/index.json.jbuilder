json.array!(@demanded_skills) do |demanded_skill|
  json.extract! demanded_skill, :id, :employer_user_id, :skill_id, :level, :created_at
  json.url demanded_skill_url(demanded_skill, format: :json)
end
