class Candidato < ApplicationRecord
    has_many :candidaturas, dependent: :destroy

    validates :nome, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  end
  