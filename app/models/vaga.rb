class Vaga < ApplicationRecord
  belongs_to :empregador
  has_many :candidaturas
  
  validates :titulo, presence: true
  validates :descricao, presence: true
end