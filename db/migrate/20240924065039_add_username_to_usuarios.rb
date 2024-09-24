class AddUsernameToUsuarios < ActiveRecord::Migration[7.0]
  def change
    add_column :usuarios, :username, :string, null: false
    add_index :usuarios, :username, unique: true
  end
end