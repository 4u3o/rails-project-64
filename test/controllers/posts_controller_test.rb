require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
  end

  test "#index" do
    get root_url
    assert_response :success
  end

  test "#new" do
    sign_in users(:one)

    get new_post_url
    assert_response :success
  end

  test "#create" do
    sign_in users(:one)

    assert_difference("Post.count") do
      post posts_url,
           params: {
             post: {
               body: @post.body,
               category_id: @post.category_id,
               title: @post.title
             }
           }
    end

    assert { Post.last.title == @post.title }
    assert { Post.last.body == @post.body }
    assert { Post.last.category_id == @post.category_id }

    assert_redirected_to post_url(Post.last)
  end

  test "#show" do
    get post_url(@post)
    assert_response :success
  end
end
