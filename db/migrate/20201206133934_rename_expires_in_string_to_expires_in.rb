class RenameExpiresInStringToExpiresIn < ActiveRecord::Migration[6.0]
  def change
    rename_column :access_tokens, :expires_in_string, :expires_in
  end
end
