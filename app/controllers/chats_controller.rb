class ChatsController < ApplicationController
  after_action :verify_authorized, except: :index

  def index
    @chats = current_user.chats
  end

  def new
    @chat = Chat.new
    authorize @chat
  end

  def create
    @chat = Chat.new(title: Chat::DEFAULT_TITLE)
    authorize @chat
    @chat.user = current_user

    @chat.save
    redirect_to chat_path(@chat)
  end

  def show
    @chat = Chat.find(params[:id])
    authorize @chat
    @message = Message.new
  end
end
