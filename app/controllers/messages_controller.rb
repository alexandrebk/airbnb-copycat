class MessagesController < ApplicationController
  def conversations
    @friends = current_user.friends
  end

  def index
    @messages = current_user.conversation_with(params[:user_id])
    @message  = Message.new
    @friend   = User.find(params[:user_id])
  end

  def create
    @message = Message.new(message_params)
    @message.sender = current_user
    @message.receiver = User.find(params[:user_id])
    if @message.save
      redirect_to user_messages_path(@message.receiver)
    else
      @friend   = User.find(params[:user_id])
      @messages = current_user.conversation_with(params[:user_id])
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
