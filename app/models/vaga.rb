class Vaga < ApplicationRecord
  belongs_to :empregador
  validates :titulo, presence: true
  validates :descricao, presence: true
end
