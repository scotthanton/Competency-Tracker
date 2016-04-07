class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  # GET /users/1
  def show
    if @user.user_level == 0
		@user_skills = UserSkillAssignment.where(:user_id => @user.id).order("id DESC")
	elsif @user.user_level == 1
		@user_endorsements = Endorsement.where(:user_id_endorser => @user.id).order("id DESC")
	end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
	
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:id)
    end
end
