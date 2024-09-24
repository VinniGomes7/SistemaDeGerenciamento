class RemoveSalarioAndLocalizacaoFromVagas < ActiveRecord::Migration[7.0]
  def change
    remove_column :vagas, :salario, :decimal
    remove_column :vagas, :localizacao, :string
  end
end
