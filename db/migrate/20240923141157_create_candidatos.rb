class CreateCandidatos < ActiveRecord::Migration[7.0]
  def change
    create_table :candidatos do |t|
      t.string :nome, null: false
      t.string :email, null: false
      t.string :telefone

      t.timestamps
    end
  end
end