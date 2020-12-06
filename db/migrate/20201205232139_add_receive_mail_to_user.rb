class AddReceiveMailToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :receive_mail, :boolean, default: false
  end
end
