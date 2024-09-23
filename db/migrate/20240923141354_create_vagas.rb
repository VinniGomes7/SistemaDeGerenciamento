class CreateVagas < ActiveRecord::Migration[7.0]
  def change
    create_table :vagas do |t|
      t.string :titulo
      t.text :descricao
      t.references :empregador, null: false, foreign_key: true

      t.timestamps
    end
  end
end
