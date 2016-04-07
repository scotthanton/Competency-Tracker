class EndorsementsController < ApplicationController
  before_action :set_endorsement, only: [:ajax_destroy, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:ajax_create, :ajax_destroy, :create, :destroy, :update]

  # GET /endorsements
  # GET /endorsements.json
  def index
    @endorsements = Endorsement.all
  end

  # GET /endorsements/1
  # GET /endorsements/1.json
  def show
  end

  # GET /endorsements/new
  def new
    @endorsement = Endorsement.new
	@programmers = User.where(:user_level => 0)
	@managers = User.where(:user_level => 1);
	@skillassignments = UserSkillAssignment.all
  end

  # GET /endorsements/1/edit
  def edit
  end

  # POST /endorsements
  # POST /endorsements.json
  def create
    @endorsement = Endorsement.new(endorsement_params)
	@skillassignment = UserSkillAssignment.where(:id => params[:endorsement][:user_skill_assignments_id]).first
	@programmer = User.where(:id => @skillassignment.user_id).first;
	@endorsement.user_id = @programmer.id
	
	if current_user.user_level != 9
		@endorsement.user_id_endorser = current_user.id
	end
	
    respond_to do |format|
      if @endorsement.save
        format.html { redirect_to @endorsement, notice: 'Endorsement was successfully created.' }
        format.json { render :show, status: :created, location: @endorsement }
      else
        format.html { render :new }
        format.json { render json: @endorsement.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def ajax_create
    if (params[:user_skill_assignments_id] && current_user.user_level == 1)
		@endorsement = Endorsement.new(ajax_endorsement_params)
		@skillassignment = UserSkillAssignment.where(:id => params[:user_skill_assignments_id]).first
		@programmer = User.where(:id => @skillassignment.user_id).first;
		@endorsement.user_id = @programmer.id
		
		@check = Endorsement.where(:user_id_endorser => current_user.id).where(:user_skill_assignments_id => params[:user_skill_assignments_id]).first
		
		if (@check.nil?)
			@endorsement.user_id_endorser = current_user.id
			respond_to do |format|
			  if @endorsement.save
				format.js
			  else
				format.json { render json: @endorsement.errors, status: :unprocessable_entity }
			  end
			end
		end
	end
  end
  # PATCH/PUT /endorsements/1
  # PATCH/PUT /endorsements/1.json
  def update
    respond_to do |format|
      if @endorsement.update(endorsement_params)
        format.html { redirect_to @endorsement, notice: 'Endorsement was successfully updated.' }
        format.json { render :show, status: :ok, location: @endorsement }
      else
        format.html { render :edit }
        format.json { render json: @endorsement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /endorsements/1
  # DELETE /endorsements/1.json
  def destroy
    @endorsement.destroy
    respond_to do |format|
      format.html { redirect_to endorsements_url, notice: 'Endorsement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def ajax_destroy
	@copy = @endorsement
    @endorsement.destroy
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_endorsement
      @endorsement = Endorsement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def endorsement_params
      params.require(:endorsement).permit(:user_id, :user_id_endorser, :user_skill_assignments_id, :created_at, :updated_at)
    end
	
	def ajax_endorsement_params
	  params.permit(:user_skill_assignments_id)
	end
end
