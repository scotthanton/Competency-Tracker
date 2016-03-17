class UserSkillAssignment < ActiveRecord::Base
	has_one :user
	has_one :skill
	has_one :skill_level, :class_name => 'SkillLevel', :foreign_key => 'skill_id'
end
