module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      token = request.params[:token]
      decoded = JWT.decode(token, Rails.application.credentials.secret_key_base, true, algorithm: 'HS256')
      self.current_user = User.find(decoded[0]['user_id'])
    rescue
      reject_unauthorized_connection
    end
  end
end
