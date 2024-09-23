class Usuario < ApplicationRecord
  has_secure_password
  
  validates :username, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end