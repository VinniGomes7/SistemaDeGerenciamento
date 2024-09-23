class CreateCandidaturas < ActiveRecord::Migration[7.0]
  def change
    create_table :candidaturas do |t|
      t.references :candidato, null: false, foreign_key: true
      t.references :vaga, null: false, foreign_key: true

      t.timestamps
    end
  end
end
