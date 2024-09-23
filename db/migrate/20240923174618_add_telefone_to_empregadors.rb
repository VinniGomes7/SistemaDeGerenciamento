class AddTelefoneToEmpregadors < ActiveRecord::Migration[7.0]
  def change
    add_column :empregadors, :telefone, :string
  end
end
