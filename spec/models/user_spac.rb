require 'rails_helper'
descride User do
  descride '#create' do
    it "is invalid without a nickname"
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000",password_confirmation: "00000000")
      user.valid
      expect(user.errors[:nickname]).to include("can't be blank")
    end
  end
end
