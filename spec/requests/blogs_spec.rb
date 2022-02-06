# require "rails helper"

RSpec.describe "/blogs", type: :request do
  current_user = User.first_or_create!(email: "hamza@gmail.com", password:"qwerty", password_confirmation: "qwerty")
  let(:valid_attributes) do
    {
      'id' => '1',
      'title' => 'blog title',
      'description' => 'desc'
    }
  end

  let(:invalid_attributes) do
    {
      'id' => '1',
      'title' => '',
      'description' => 'desc'
    }
  end

  # describe "GET / index" do
  #   it "render a successful response" do
  #     get blogs_url
  #     expect(response).to be_successful
  #   end
  # end

  describe "POST / create" do
    context "with valid parameters" do
      it "render a successful response" do
        blog = Blog.new(valid_attributes)
        blog.user = current_user
        blog.save
        expect(response).to be_successful
      end
    end

    context "with Invalid parameters" do
      it "render a unsuccessful response" do
        blog = Blog.new(invalid_attributes)
        blog.user = current_user
        blog.save
        expect(response).to be_unsuccessful
      end
    end
  end

  describe "PATCH / update" do
    context "with valid parameters" do
      it "pdates the requested article" do
        blog = Blog.new(valid_attributes)
        blog.user = current_user
        blog.save
        expect(response).to be_successful
      end
    end

    context "with Invalid parameters" do
      it "pdates the requested article" do
        blog = Blog.new(invalid_attributes)
        blog.user = current_user
        blog.save
        expect(response).to be_unsuccessful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested blog" do
      expect(response).to be_unsuccessful
    end
  end
end