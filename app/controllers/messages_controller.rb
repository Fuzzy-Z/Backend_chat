class MessagesController < ApplicationController
  before_action :authenticate_user

  def message_params
  params.require(:message).permit(:receiver_id, :content)
  end


 def create
  @message = @current_user.messages.new(message_params)
  if @message.save
    render json: @message, status: :created
  else
    render json: { errors: @message.errors.full_messages }, status: :unprocessable_entity
  end
end

  def index
    messages = Message.where("sender_id = ? OR receiver_id = ?", @current_user.id, @current_user.id)
    render json: messages 
  end
end
