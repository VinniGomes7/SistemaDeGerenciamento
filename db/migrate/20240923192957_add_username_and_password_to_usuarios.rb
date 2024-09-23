class AddUsernameAndPasswordToUsuarios < ActiveRecord::Migration[7.0]
  def change
    add_column :usuarios, :username, :string
    add_column :usuarios, :password_digest, :string
  end
end
