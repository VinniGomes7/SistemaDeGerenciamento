class Usuario < ApplicationRecord
  has_secure_password
  
  validates :nome, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :username, presence: true, uniqueness: true
end