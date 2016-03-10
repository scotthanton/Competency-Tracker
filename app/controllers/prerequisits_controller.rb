class PrerequisitsController < ApplicationController
  before_action :set_prerequisit, only: [:show, :edit, :update, :destroy]

  # GET /prerequisits
  # GET /prerequisits.json
  def index
    @prerequisits = Prerequisit.all
  end

  # GET /prerequisits/1
  # GET /prerequisits/1.json
  def show
  end

  # GET /prerequisits/new
  def new
    @prerequisit = Prerequisit.new
  end

  # GET /prerequisits/1/edit
  def edit
  end

  # POST /prerequisits
  # POST /prerequisits.json
  def create
    @prerequisit = Prerequisit.new(prerequisit_params)

    respond_to do |format|
      if @prerequisit.save
        format.html { redirect_to @prerequisit, notice: 'Prerequisit was successfully created.' }
        format.json { render :show, status: :created, location: @prerequisit }
      else
        format.html { render :new }
        format.json { render json: @prerequisit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prerequisits/1
  # PATCH/PUT /prerequisits/1.json
  def update
    respond_to do |format|
      if @prerequisit.update(prerequisit_params)
        format.html { redirect_to @prerequisit, notice: 'Prerequisit was successfully updated.' }
        format.json { render :show, status: :ok, location: @prerequisit }
      else
        format.html { render :edit }
        format.json { render json: @prerequisit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prerequisits/1
  # DELETE /prerequisits/1.json
  def destroy
    @prerequisit.destroy
    respond_to do |format|
      format.html { redirect_to prerequisits_url, notice: 'Prerequisit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prerequisit
      @prerequisit = Prerequisit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prerequisit_params
      params.require(:prerequisit).permit(:skill_id, :prerequisit_skill_id)
    end
end
