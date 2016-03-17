class Material < ActiveRecord::Base
	belongs_to :skill
	belongs_to :skill_level, :class_name => 'SkillLevel', :foreign_key => 'level_id'
end
