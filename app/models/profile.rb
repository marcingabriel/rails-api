class Profile < ApplicationRecord


    validates :name, presence: { message: " Digite o nome " }
    validates :cpf, presence: {message: " Não pode ficar em branco "}, length: { minimum: 11, maximum: 11 , message: " (mínimo de 11 caracteres)" }
    validates :phone, presence: { message: " Digite o numero " }, format: { with: /\A\d+\z/,  message: " Numero Invalido" }
    validates :city, presence: { message: " Digite a cidade " }
    validates :email, presence: { message: " Digite o email " }, format: { with: URI::MailTo::EMAIL_REGEXP }


end