class User < ApplicationRecord

  validates :name, presence: true
  validates :email, presence:true, uniqueness: true
  validates :phone, presence: true
  validates :receive_mail

  
end
