class UserSkillAssignment < ActiveRecord::Base
	belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
	belongs_to :skill, :class_name => 'Skill', :foreign_key => 'skill_id'
	belongs_to :skill_level, :class_name => 'SkillLevel', :foreign_key => 'level_id'
	
    def skill_with_level
	   @skill = Skill.where(:id => skill_id).first
	   @level = SkillLevel.where(:id => level_id).first
	   @user = User.where(:id => user_id).first
	   
	   "#{@user.email}: #{@skill.name} #{@level.level}" 
    end
  
end
