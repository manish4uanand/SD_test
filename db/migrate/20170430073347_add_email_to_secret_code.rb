class AddEmailToSecretCode < ActiveRecord::Migration
  def change
    add_column :secret_codes, :email, :string
  end
end
