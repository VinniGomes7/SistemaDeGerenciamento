class CreateVagas < ActiveRecord::Migration[7.0]
  def change
    create_table :vagas do |t|
      t.string :title
      t.text :description
      t.references :empregador, foreign_key: true

      t.timestamps
    end
  end
end