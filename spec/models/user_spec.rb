require 'rails_helper'

RSpec.describe User, type: :model do
 
  context 'valid factory' do
    it { expect(build(:user)).to be_valid }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:phone) }
  end

  describe 'Scopes' do
    context 'by_receive_mail' do
      let!(:user1){ create(:user, receive_mail: true) }
      let!(:user2){ create(:user, receive_mail: false) }

      it { expect(User.by_receive_mail(true)).to include(user1) }
      it { expect(User.by_receive_mail(true)).to_not include(user2) }
      it { expect(User.by_receive_mail(false)).to include(user2) }
      it { expect(User.by_receive_mail(false)).to_not include(user1) }
    end

    context 'by_info_status_empty' do
      let!(:user1){ create(:user, send_information_status: '') }
      let!(:user2){ create(:user, send_information_status: 'opted-in') }

      it { expect(User.by_info_status_empty).to include(user1) }
      it { expect(User.by_info_status_empty).to_not include(user2) }
    end

    context 'by_info_status_not_empty' do
      let!(:user1){ create(:user, send_information_status: '') }
      let!(:user2){ create(:user, send_information_status: 'opted-in') }

      it { expect(User.by_info_status_not_empty).to include(user2) }
      it { expect(User.by_info_status_not_empty).to_not include(user1) }
    end

  end  
end
