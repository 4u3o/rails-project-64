require "test_helper"

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user

    @post = posts(:one)
    @root_comment = post_comments(:root)
  end

  test "#create" do
    comment_params = {
      content: Faker::Lorem.sentence,
      parent_id: nil
    }

    assert_difference("PostComment.count") do
      post post_comments_url(@post),
           params: {post_comment: comment_params}
    end

    comment = PostComment.find_by(content: comment_params[:content])

    assert { comment }
    assert { comment.user == @user }
    assert { comment.ancestry.nil? }

    assert_redirected_to post_url(@post)
  end

  test "#create nested comment" do
    comment_params = {
      content: Faker::Lorem.sentence,
      parent_id: @root_comment.id
    }

    assert_difference("@root_comment.children.count") do
      post post_comments_url(@post),
           params: {post_comment: comment_params}
    end

    comment = PostComment.find_by(content: comment_params[:content])

    assert { comment }
    assert { comment.user == @user }
    assert { comment.parent == @root_comment }
  end
end
