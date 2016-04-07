class UserSkillAssignmentsController < ApplicationController
  before_action :set_user_skill_assignment, only: [:show, :myskills_show, :edit, :update, :destroy, :myskills_destroy]
  before_action :authenticate_user!, only: [:myskills, :myskills_show, :edit, :update, :destroy, :myskills_destroy]
  before_action :am_i_allowed, only: [:new, :edit, :update, :destroy]

  # GET /user_skill_assignments
  # GET /user_skill_assignments.json
  def index
  
	if !params[:Skill].nil? && !params[:SkillLevel].nil? 
		if params[:Skill][:skill_id] && params[:SkillLevel][:level_id]
			@skill_id = params[:Skill][:skill_id]
			@level_id = params[:SkillLevel][:level_id]
			@user_skill_assignments = UserSkillAssignment.where(:skill_id => @skill_id).where(:skill_level => @level_id).order("created_at DESC")
			
		else
			@user_skill_assignments = UserSkillAssignment.last(20).reverse
		end
	else
		@user_skill_assignments = UserSkillAssignment.last(20).reverse
	end
  end
  
  
  # GET /my_skills
  def myskills
	@user_skill_assignments = UserSkillAssignment.where(:user_id => current_user.id)
  end
  
  # GET /my_skills/1
  def myskills_show
  end
  
  # GET /my_skills/new
  def myskills_new
    @user_skill_assignment = UserSkillAssignment.new
  end

  # GET /my_skills/destroy/:id
  def myskills_destroy
	if @user_skill_assignment.user_id == current_user.id
		@user_skill_assignment.destroy
		respond_to do |format|
		  format.html { redirect_to my_skills_path, notice: 'User skill assignment was successfully destroyed.' }
		  format.json { head :no_content }
		end
	end
  end
  
  # GET /user_skill_assignments/1
  # GET /user_skill_assignments/1.json
  def show
  end

  # GET /user_skill_assignments/new
  def new
    @user_skill_assignment = UserSkillAssignment.new
  end

  # GET /user_skill_assignments/1/edit
  def edit
  end

  # POST /user_skill_assignments
  # POST /user_skill_assignments.json
  def create
	if params[:user_id].nil?
	
	  @user_skill_assignment = UserSkillAssignment.new(user_skill_assignment_params.merge(:user_id => current_user.id))
	  @assignment_check = UserSkillAssignment.where(:user_id => @user_skill_assignment.user_id).where(:skill_id => @user_skill_assignment.skill_id).where(:level_id => @user_skill_assignment.level_id).first

	  @prerequisite = Prerequisite.where(:skill_id => @user_skill_assignment.skill_id).where(:level_id => @user_skill_assignment.level_id).first
	  if @prerequisite
		@prerequisite_skill = Skill.where(:id => @prerequisite.prerequisite_skill_id).first
		@prerequisite_level = SkillLevel.where(:id => @prerequisite.prerequisite_level_id).first
		@user_has = UserSkillAssignment.where(:user_id =>@user_skill_assignment.user_id).where(:skill_id => @prerequisite_skill.id).where(:level_id => @prerequisite_level.id).first
	  end
	  
	  respond_to do |format|
		if @assignment_check.nil?
			if @prerequisite.nil? || !@user_has.nil?
			   if @user_skill_assignment.save
			     format.html { redirect_to myskills_path, notice: 'The skill was successfully added to your profile!' }
			     format.json { render :show, status: :created, location: @user_skill_assignment }
			   else
			     format.html { render :new }
			     format.json { render json: @user_skill_assignment.errors, status: :unprocessable_entity }
			   end
		    else
				format.html { redirect_to myskills_path, notice: "You do not have the prerequisite for this skill #{@prerequisite_skill.name}: #{@prerequisite_level.level}" }
				format.json { render :show, status: :created, location: @assignment_check }
			end
		else
			format.html { redirect_to myskills_path, notice: 'This skill is already on your profile.' }
			format.json { render :show, status: :created, location: @assignment_check }
		end
	  end
	else
		@user_skill_assignment = UserSkillAssignment.new(user_skill_assignment_params)

		respond_to do |format|
		  if @user_skill_assignment.save
			format.html { redirect_to @user_skill_assignment, notice: 'User skill assignment was successfully created.' }
			format.json { render :show, status: :created, location: @user_skill_assignment }
		  else
			format.html { render :new }
			format.json { render json: @user_skill_assignment.errors, status: :unprocessable_entity }
		  end
		end
	end
  end

  # PATCH/PUT /user_skill_assignments/1
  # PATCH/PUT /user_skill_assignments/1.json
  def update
    respond_to do |format|
      if @user_skill_assignment.update(user_skill_assignment_params)
        format.html { redirect_to @user_skill_assignment, notice: 'User skill assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_skill_assignment }
      else
        format.html { render :edit }
        format.json { render json: @user_skill_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_skill_assignments/1
  # DELETE /user_skill_assignments/1.json
  def destroy
    @user_skill_assignment.destroy
    respond_to do |format|
      format.html { redirect_to user_skill_assignments_url, notice: 'User skill assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_skill_assignment
      @user_skill_assignment = UserSkillAssignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_skill_assignment_params
      params.require(:user_skill_assignment).permit(:user_id, :skill_id, :level_id)
    end
	
	def am_i_allowed
	  if current_user.try(:user_level) == 9
		return true
	  else
	     permission_denied
	  end
	end
end
