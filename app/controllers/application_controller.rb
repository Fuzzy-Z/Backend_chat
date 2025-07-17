class ApplicationController < ActionController::API
  def authenticate_user
    header = request.headers['Authorization']
    token = header.split(' ').last if header.present?

    begin
      decoded = JWT.decode(token, Rails.application.credentials.secret_key_base)[0]
      @current_user = User.find(decoded['user_id'])
    rescue JWT::DecodeError, ActiveRecord::RecordNotFound
      render json: { error: 'Não autorizado' }, status: :unauthorized
    end
  end
end