class Usuario < ApplicationRecord
  has_secure_password
  
  validates :nome, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true
end
