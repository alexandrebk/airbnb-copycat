class MessagesController < ApplicationController
  before_action :set_messages, only: [:index, :create]
  before_action :set_friend, only: [:index, :create]

  def conversations
    @friends = current_user.friends
  end

  def index
    @message = Message.new
  end

  def create
    @message          = Message.new(message_params)
    @message.sender   = current_user
    @message.receiver = User.find(params[:user_id])
    if @message.save
      redirect_to user_messages_path(@message.receiver)
    else
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_messages
    @messages = current_user.conversation_with(params[:user_id])
  end

  def set_friend
    @friend = User.find(params[:user_id])
  end
end
