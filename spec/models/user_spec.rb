require 'rails_helper'

RSpec.describe User, type: :model do
  current_user = User.first_or_create(email: "josue@example.com", password: "password", password_confirmation: "password")

  it "has a user" do
    @post = Post.new(
      title: "Has a title",
      body: "A valid body",
      views: 0
    )
    expect(@post).to_not be_valid
    @post.user = current_user
    expect(@post).to be_valid
  end

end
