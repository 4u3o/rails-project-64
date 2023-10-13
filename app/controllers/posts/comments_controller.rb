class Posts::CommentsController < Posts::ApplicationController
  def create
    @comment = current_user.comments.build(
      comment_params.merge({post_id: @post.id})
    )

    if @comment.save
      redirect_to @post, notice: t('.success')
    else
      redirect_to @post, alert: @comment.errors.full_messages.join('\n')
    end
  end

  private

    def comment_params
      params.require(:post_comment).permit(:content, :parent_id)
    end
end
