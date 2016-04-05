json.array!(@user_skill_assignments) do |user_skill_assignment|
  json.extract! user_skill_assignment, :id, :user_id, :skill_id, :level_id
  json.url user_skill_assignment_url(user_skill_assignment, format: :json)
end
