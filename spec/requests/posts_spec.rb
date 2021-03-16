 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/posts", type: :request do
  
  # Post. As you add validations to Post, be sure to
  # adjust the attributes here as well.
  current_user = User.first_or_create(email: "josue@example.com", password: "password", password_confirmation: "password")

  let(:valid_attributes) do
    {
    'id' => '1',
    'title' => 'Test',
    'body' => 'This is the body'
    }
  end

  let(:invalid_attributes) do 
    {
      'id' => 'a',
      'title' => '',
      'body' => ''
    }
  end

  describe "GET /index" do
    it "renders a successful response" do
      post = Post.new(valid_attributes)
      post.user = current_user
      post.save
      get posts_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      post = Post.new(valid_attributes)
      post.user = current_user
      post.save
      get post_url(post)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_post_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      post = Post.new(valid_attributes)
      post.user = current_user
      post.save
      get edit_post_url(post)
      expect(response).to be_successful
    end
  end

end
