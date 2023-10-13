require "test_helper"

class Posts::LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user

    @post = posts(:two)
  end

  test "#create" do
    assert_difference("PostLike.count") do
      post post_likes_url(@post)
    end

    assert { PostLike.where(user: @user, post: @post).count == 1 }
  end

  test "#destroy" do
    assert_difference("PostLike.count", -1) do
      delete post_like_url(@post, post_likes(:one))
    end

    assert { PostLike.where(user: @user, post: @post).empty? }
  end
end
