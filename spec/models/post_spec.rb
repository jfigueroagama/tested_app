require 'rails_helper'

RSpec.describe Post, type: :model do
  current_user = User.first_or_create(email: "josue@example.com", password: "password", password_confirmation: "password")
  
  it "has a title" do
    @post = Post.new(
      title: "",
      body: "A valid body",
      user: current_user,
      views: 0
    )
    expect(@post).to_not be_valid
    @post.title = "Has a title"
    expect(@post).to be_valid
  end

  it "has a body" do
     @post = Post.new(
      title: "A valid title",
      body: "",
      user: current_user,
      views: 0
    )
    expect(@post).to_not be_valid
    @post.body = "A valid body"
    expect(@post).to be_valid
  end

  it "it has a title at least 2 char long" do
     @post = Post.new(
      title: "A",
      body: "A valid body",
      user: current_user,
      views: 0
    )
    expect(@post).to_not be_valid
    @post.title = "a valid title"
    expect(@post).to be_valid
  end

  it "has a body between 5 and 100 characters long" do
    @post = Post.new(
      title: "A valid title",
      body: "",
      user: current_user,
      views: 0
    )
    expect(@post).to_not be_valid
    @post.body = "A val"
    expect(@post).to be_valid
    big_string = "iCacygFDAuUxtAKRtUCdV5jUSXSWZwjBfDHFMMvy8WluW7j80Np54Q0ZQdVkCsI6dZeyVEf4lNeXkfr3jn4z9gjep8H5ap8BV4Vw"
    @post.body = big_string
    expect(@post).to be_valid
    @post.body = big_string + "1"
    expect(@post).to_not be_valid
  end

  it "has numerical views" do
    @post = Post.new(
      title: "A valid title",
      body: "A valid body",
      user: current_user,
      views: 0
    )
    expect(@post.views).to be_a(Integer)
  end
end
