class UserSkillAssignmentsController < ApplicationController
  before_action :set_user_skill_assignment, only: [:show, :edit, :update, :destroy]

  # GET /user_skill_assignments
  # GET /user_skill_assignments.json
  def index
    @user_skill_assignments = UserSkillAssignment.all
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
end
