class DemandedSkillsController < ApplicationController
  before_action :set_demanded_skill, only: [:show, :edit, :update, :destroy]

  # GET /demanded_skills
  # GET /demanded_skills.json
  def index
    @demanded_skills = DemandedSkill.all
  end

  # GET /demanded_skills/1
  # GET /demanded_skills/1.json
  def show
  end

  # GET /demanded_skills/new
  def new
    @demanded_skill = DemandedSkill.new
  end

  # GET /demanded_skills/1/edit
  def edit
  end

  # POST /demanded_skills
  # POST /demanded_skills.json
  def create
    @demanded_skill = DemandedSkill.new(demanded_skill_params)

    respond_to do |format|
      if @demanded_skill.save
        format.html { redirect_to @demanded_skill, notice: 'Demanded skill was successfully created.' }
        format.json { render :show, status: :created, location: @demanded_skill }
      else
        format.html { render :new }
        format.json { render json: @demanded_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /demanded_skills/1
  # PATCH/PUT /demanded_skills/1.json
  def update
    respond_to do |format|
      if @demanded_skill.update(demanded_skill_params)
        format.html { redirect_to @demanded_skill, notice: 'Demanded skill was successfully updated.' }
        format.json { render :show, status: :ok, location: @demanded_skill }
      else
        format.html { render :edit }
        format.json { render json: @demanded_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /demanded_skills/1
  # DELETE /demanded_skills/1.json
  def destroy
    @demanded_skill.destroy
    respond_to do |format|
      format.html { redirect_to demanded_skills_url, notice: 'Demanded skill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_demanded_skill
      @demanded_skill = DemandedSkill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def demanded_skill_params
      params.require(:demanded_skill).permit(:employer_user_id, :skill_id, :level, :created_at)
    end
end
