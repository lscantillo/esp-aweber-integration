class User < ApplicationRecord

  validates :name, presence: true
  validates :email, presence:true, uniqueness: true
  validates :phone, presence: true
  
  scope :by_receive_mail, ->(arg) { where(receive_mail: arg) }
  scope :by_info_status_empty, -> { where(send_information_status: '') }
  scope :by_info_status_not_empty, -> { where("send_information_status != ''") }
end
