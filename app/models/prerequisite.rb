class Prerequisite < ActiveRecord::Base
	belongs_to :skill
	belongs_to :prerequisite, :class_name => 'Prerequisite', :foreign_key => 'prerequisite_skill_id'
	
end
