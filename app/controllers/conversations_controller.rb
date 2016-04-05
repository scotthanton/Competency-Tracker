class ConversationsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :show, :edit, :update, :destroy]
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]

  # GET /conversations
  # GET /conversations.json
  def index
	@conversations = Conversation.where("conversations.user_id_creator = '#{current_user.id}' OR conversations.user_id_recipient = '#{current_user.id}'").order('id DESC')
	@conversations.order('id DESC')
	
  end

  # GET /conversations/1
  # GET /conversations/1.json
  def show
	@user_creator=User.where(:id => @conversation.user_id_creator).first	
	@user_recipient=User.where(:id => @conversation.user_id_recipient).first	
	@reply = Reply.new
	@conversation_replies = Reply.where(:conversation_id => @conversation.id).order('replies.id DESC')
	
	@conversation_replies_them = @conversation_replies.where.not(:user_id => current_user.id)
	@conversation_replies_them.update_all(:read => '1')
  end

  # GET /conversations/new
  def new
    @conversation = Conversation.new
	@elligible_recipients = User.all.reject {|user| user == current_user}
	
	if !params[:user_id].nil?
		@selected_recipient = User.where(:id => params[:user_id]);
	end
  end

  # GET /conversations/1/edit
  def edit
  end

  # POST /conversations
  # POST /conversations.json
  def create
    @conversation = Conversation.new(conversation_params.merge(:user_id_creator => current_user.id))

    respond_to do |format|
      if @conversation.save
        format.html { redirect_to @conversation, notice: "Conversation was successfully created. id - #{current_user.id}" }
        format.json { render :show, status: :created, location: @conversation }
      else
        format.html { render :new }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conversations/1
  # PATCH/PUT /conversations/1.json
  def update
    #respond_to do |format|
    #  if @conversation.update(conversation_params)
    #    format.html { redirect_to @conversation, notice: 'Conversation was successfully updated.' }
    #    format.json { render :show, status: :ok, location: @conversation }
    #  else
    #    format.html { render :edit }
    #    format.json { render json: @conversation.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # DELETE /conversations/1
  # DELETE /conversations/1.json
  def destroy
    @conversation.destroy
    respond_to do |format|
      format.html { redirect_to conversations_url, notice: 'Conversation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
	  if @conversation.user_id_creator != current_user.id
		@conversation.read = 1
		@conversation.save!
	  end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conversation_params
      params.require(:conversation).permit(:user_id_creator, :user_id_recipient, :title, :content, :created_at)
    end
end
