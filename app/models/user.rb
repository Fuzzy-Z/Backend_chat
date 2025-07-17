class User < ApplicationRecord
  has_secure_password
  # Mensagens enviadas pelo usuário
  has_many :messages, foreign_key: :sender_id
  # Mensagens recebidas pelo usuário
  has_many :received_messages, class_name: 'Message', foreign_key: :receiver_id

  validates :email, presence: true, uniqueness: true
end
