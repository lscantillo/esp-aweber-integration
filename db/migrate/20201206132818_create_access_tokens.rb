class CreateAccessTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :access_tokens do |t|
      t.text :access_token
      t.string :expires_in_string

      t.timestamps
    end
  end
end
