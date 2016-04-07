class Skill < ActiveRecord::Base
     has_many :user
	 has_many :endorsements
	 has_one :prerequisite, :class_name => 'Skill'
	 has_one :materials
	 has_many :demanded_skill
	 has_many :user_skill_assignments
	 
end
