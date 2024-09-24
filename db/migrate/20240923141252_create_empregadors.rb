class CreateEmpregadors < ActiveRecord::Migration[7.0]
  def change
    create_table :empregadors do |t|
      t.string :nome, null: false
      t.string :email, null: false
      t.string :telefone

      t.timestamps
    end

    add_index :empregadors, :email, unique: true
  end
end
