class AddTitleAndDescriptionToVagas < ActiveRecord::Migration[6.0]
  def change
    unless column_exists?(:vagas, :title)
      add_column :vagas, :title, :string
    end

    unless column_exists?(:vagas, :description)
      add_column :vagas, :description, :text
    end
  end
end