class AuthController < ApplicationController
  # POST de /register
  def register
    user = User.new(user_params)
    if user.save
      render json: { message: "Você agora é um de nós :)" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  # POST de /login
  def login
    # Procura o usuário no banco de dados, com o email digitado
    user = User.find_by(email: params[:email])

    # Verifica se o usuário existe e se a senha coincide
    if user&.authenticate(params[:password])
      # Gera o token JWT
      token = JWT.encode({ user_id: user.id }, Rails.application.credentials.secret_key_base)
      # Retorna o token e o user_id
      render json: { token: token, user_id: user.id }
    else
      # Dados incorretos
      render json: { error: "Ei! Quem é você? >:( " }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
