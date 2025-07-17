class MessagesController < ApplicationController
  before_action :authenticate_user

  def create
    receiver = User.find_by(email: message_params[:receiver_email])
    unless receiver
      render json: { error: 'Destinatário não encontrado' }, status: :not_found
      return
    end

    @message = @current_user.messages.new(
      receiver_id: receiver.id,
      content: message_params[:content]
    )

if @message.save
  payload = {
    id: @message.id,
    sender_id: @message.sender_id,
    receiver_id: @message.receiver_id,
    content: @message.content,
    created_at: @message.created_at
  }

  # Envia para o destinatário
  ChatChannel.broadcast_to(receiver, payload)

  # Envia para o remetente 
  ChatChannel.broadcast_to(@current_user, payload)

  render json: @message, status: :created
else
  render json: { errors: @message.errors.full_messages }, status: :unprocessable_entity
end

  end

  def index
    messages = Message.where("sender_id = ? OR receiver_id = ?", @current_user.id, @current_user.id)
    render json: messages
  end

  private

  def message_params
    params.require(:message).permit(:receiver_email, :content)
  end
end
