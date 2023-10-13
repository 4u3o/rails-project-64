require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @post = posts(:one)
    @category = categories(:one)
  end

  test "#index" do
    get root_url
    assert_response :success
  end

  test "#new" do
    sign_in @user

    get new_post_url
    assert_response :success
  end

  test "#create" do
    sign_in @user

    post_params = {
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph_by_chars,
      category_id: @category.id
    }

    assert_difference("Post.count") do
      post posts_url,
           params: {post: post_params}
    end

    post = Post.find_by(title: post_params[:title])

    assert { post }
    assert { post.body == post_params[:body] }
    assert { post.category_id == @category.id }
    assert { post.creator_id == @user.id }

    assert_redirected_to post_url(post)
  end

  test "#show" do
    get post_url(@post)
    assert_response :success
  end
end
