class PrerequisitesController < ApplicationController
  before_action :am_i_allowed, only: [:new, :create, :update, :destroy, :edit]
  before_action :set_prerequisite, only: [:show, :edit, :update, :destroy]

  # GET /prerequisites
  # GET /prerequisites.json
  def index
    @prerequisites = Prerequisite.all
  end

  # GET /prerequisites/1
  # GET /prerequisites/1.json
  def show
  end

  # GET /prerequisites/new
  def new
    @prerequisite = Prerequisite.new
  end

  # GET /prerequisites/1/edit
  def edit
  end

  # POST /prerequisites
  # POST /prerequisites.json
  def create
    @prerequisite = Prerequisite.new(prerequisite_params)

	if @prerequisite.prerequisite_skill_id == @prerequisite.skill_id && @prerequisite.prerequisite_level_id == @prerequisite.level_id
		redirect_to prerequisits_path, notice: 'The prerequisite cannot be the skill with the same level.'
	else
		@check = Prerequisite.where(:skill_id => @prerequisite.skill_id).where(:level_id => @prerequisite.level_id).first
		
		if @check.nil?
			respond_to do |format|
			  if @prerequisite.save
				format.html { redirect_to @prerequisite, notice: 'Prerequisite was successfully created.' }
				format.json { render :show, status: :created, location: @prerequisite }
			  else
				format.html { render :new }
				format.json { render json: @prerequisite.errors, status: :unprocessable_entity }
			  end
			end
		else
			redirect_to prerequisits_path, notice: 'Prerequisite already exists.'
		end
	end
  end

  # PATCH/PUT /prerequisites/1
  # PATCH/PUT /prerequisites/1.json
  def update
    respond_to do |format|
      if @prerequisite.update(prerequisite_params)
        format.html { redirect_to @prerequisite, notice: 'Prerequisite was successfully updated.' }
        format.json { render :show, status: :ok, location: @prerequisite }
      else
        format.html { render :edit }
        format.json { render json: @prerequisite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prerequisites/1
  # DELETE /prerequisites/1.json
  def destroy
    @prerequisite.destroy
    respond_to do |format|
      format.html { redirect_to prerequisites_url, notice: 'Prerequisite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prerequisite
      @prerequisite = Prerequisite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prerequisite_params
	  params.require(:prerequisite).permit(:skill_id, :prerequisite_skill_id, :prerequisite_level_id, :level_id, :created_at, :updated_at)
    end
	
	def am_i_allowed
	  if current_user.try(:user_level) == 9
		return true
	  else
	     permission_denied
	  end
	end	
end
