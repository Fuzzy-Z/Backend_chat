class Message < ApplicationRecord
    # Sender = Envia; Reciever = Recebe
    # belongs_to tem relação com o modelo de USER
    belongs_to :sender, class_name: "User"
    belongs_to :receiver, class_name: "User"

    validates :content, presence: true
    validates :receiver, presence: true
    validates :sender, presence: true
end
