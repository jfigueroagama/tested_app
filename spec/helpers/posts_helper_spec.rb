require 'rails_helper'
include PostsHelper

RSpec.describe PostsHelper, type: :helper do
  it 'assign a user to a post' do
    # Arrange, Act, Assert
    # Arrange our data => Assigning variables
    creator = User.first_or_create(email: "josue@example.com", password: "password", password_confirmation: "password")
    @post = Post.new(title: "My title", body: "My Body", views: 1)
    # Act
    returned_post = assign_post_creator(@post, creator)
    #Assert
    expect(returned_post.user).to be(creator)
  end
end
