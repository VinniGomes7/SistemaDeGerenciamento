class Usuario < ApplicationRecord
    validates :username, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true
  end
  