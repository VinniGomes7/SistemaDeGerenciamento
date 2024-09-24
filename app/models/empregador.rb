class Empregador < ApplicationRecord
    has_many :vagas

    validates :nome, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  end
  