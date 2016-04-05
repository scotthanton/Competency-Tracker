class Endorsement < ActiveRecord::Base
	belongs_to :user
	belongs_to :user_skill_assignments, :class_name => 'UserSkillAssignment'
	belongs_to :endorser, :class_name => 'User', :foreign_key => 'user_id_endorser'

end
