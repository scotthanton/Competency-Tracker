class Material < ActiveRecord::Base
	belongs_to :skill, :class_name => 'Skill', :foreign_key => 'skill_id'
	belongs_to :skill_level, :class_name => 'SkillLevel', :foreign_key => 'level_id'
end
