class DemandedSkill < ActiveRecord::Base
	belongs_to :skill_level, :class_name => 'SkillLevel', :foreign_key => 'level_id'
	belongs_to :skill
	belongs_to :employer, :class_name => 'User', :foreign_key => 'user_id_employer'
end
