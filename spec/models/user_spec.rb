require 'rails_helper'

RSpec.describe User, type: :model do
  context "validation test" do
    it 'has a email' do
      user = User.new(email: '', password: "qwerty")
      expect(user).to_not be_valid
      user.email = "hamza@gmail.com"
      expect(user).to be_valid
    end

    it 'has a password' do
      user = User.new(email: 'hamza@gmail.com', password: "")
      expect(user).to_not be_valid
      user.password = "qwerty"
      expect(user).to be_valid
    end
  end
end
