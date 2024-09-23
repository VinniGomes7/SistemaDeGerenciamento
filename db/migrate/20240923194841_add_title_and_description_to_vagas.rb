class AddTitleAndDescriptionToVagas < ActiveRecord::Migration[7.0]
  def change
    add_column :vagas, :title, :string
    add_column :vagas, :description, :text
  end
end
