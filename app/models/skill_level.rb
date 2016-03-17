class SkillLevel < ActiveRecord::Base
	has_and_belongs_to_many :materials
	has_and_belongs_to_many :skills
	has_many :demanded_skills
	has_many :user_skill_assignments
end
