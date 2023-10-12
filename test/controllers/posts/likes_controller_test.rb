require "test_helper"

class Posts::LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user

    @like_from_another = post_likes(:two)
    @post = posts(:one)
  end

  test "#create" do
    assert_difference("Post::Like.count") do
      post post_likes_url(@post)
    end

    assert { Post::Like.where(user: @user, post: @post) }
  end

  test "#destroy" do
    assert_difference("Post::Like.count", -1) do
      delete post_like_url(@post, post_likes(:one))
    end
  end
end
