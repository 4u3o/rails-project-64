require "test_helper"

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @comment = post_comments(:with_comments)
    @nested_comment = post_comments(:nested)
  end

  test "#create" do
    sign_in users(:one)

    assert_difference("Post::Comment.count") do
      post post_comments_url(@post),
           params: {
             post_comment: {
               content: @comment.content,
               parent_id: nil
             }
           }
    end
  end

  test "#create nested comment" do
    sign_in users(:one)

    assert_difference("@comment.children.count") do
      post post_comments_url(@post),
           params: {
             post_comment: {
               content: @nested_comment.content,
               parent_id: @comment.id
             }
           }
    end
  end
end
