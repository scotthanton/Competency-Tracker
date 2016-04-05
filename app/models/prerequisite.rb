class Prerequisite < ActiveRecord::Base
	belongs_to :skill, :class_name => 'Skill', :foreign_key => 'skill_id'
	belongs_to :prerequisite, :class_name => 'Prerequisite', :foreign_key => 'prerequisite_skill_id'
	
end
