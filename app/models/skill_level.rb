class SkillLevel < ActiveRecord::Base
	has_many :materials
	has_many :skills
	has_many :demanded_skills
	has_many :user_skill_assignments
end
