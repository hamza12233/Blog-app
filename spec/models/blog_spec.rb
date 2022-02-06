require 'rails_helper'

RSpec.describe Blog, type: :model do
  current_user = User.first_or_create!(email: "hamza@gmail.com", password:"qwerty", password_confirmation: "qwerty")
  context "validation test" do
    it 'has a title' do
      blog = Blog.new(title: '', description: "test desc", user: current_user)
      expect(blog).to_not be_valid
      blog.title = "has a title"
      expect(blog).to be_valid
    end

    it 'has title at least 3 charecters leng' do
      blog = Blog.new(title: '', description: "test desc", user: current_user)
      expect(blog).to_not be_valid
      blog.title = "has"
      expect(blog).to be_valid
    end
  end

  describe "Associations" do
    it { should belong_to(:user).validating_presence }
  end

end
