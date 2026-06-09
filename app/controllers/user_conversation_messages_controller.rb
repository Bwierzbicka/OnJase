class UserConversationMessagesController < ApplicationController
  def create
    @user_conversation = UserConversation.find(params[:user_conversation_id])
    @user_conversation_message = @user_conversation.user_conversation_messages.new(user_conversation_message_params)
    @user_conversation_message.user_id = current_user.id
    if @user_conversation_message.save
      redirect_to user_conversation_path(@user_conversation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @user_conversation_message = UserConversationMessage.new
  end

  private

  def user_conversation_message_params
    params.require(:user_conversation_message).permit(:content, :translation)
  end
end
