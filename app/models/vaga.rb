class Vaga < ApplicationRecord
  belongs_to :empregador
  has_many :candidaturas
  
  validates :title, presence: true
  validates :description, presence: true
end