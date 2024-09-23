class Candidatura < ApplicationRecord
  belongs_to :candidato
  belongs_to :vaga

  validates :candidato_id, presence: true
  validates :vaga_id, presence: true
end
