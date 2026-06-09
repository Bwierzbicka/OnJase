class UserConversationsController < ApplicationController
  def new
    @user_conversation = UserConversation.new
  end

  def create
    # raise
    @user_conversation = UserConversation.new(user_conversation_params)
    @user_conversation.user1 = current_user
    @user_conversation.user2 = User.find(params[:user_conversation][:user_id_2].to_i)
    if @user_conversation.save
      redirect_to user_conversation_path(@user_conversation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user_conversation = UserConversation.find(params[:id])
    @user_conversation_message = @user_conversation.user_conversation_messages.new
  end

  def index
    @user_conversations = current_user.user_conversations
  end

  def destroy
    @user_conversation = UserConversation.find(params[:id])
    @user_conversation.destroy
  end

  private

  def user_conversation_params
    params.require(:user_conversation).permit(:user_id_2)
  end
end
