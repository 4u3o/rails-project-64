class Posts::LikesController < Posts::ApplicationController
  def create
    @like = @post.likes.build(user_id: current_user.id)

    redirect_to @post if @like.save
  end

  def destroy
    @like = PostLike.find params[:id]

    redirect_to @post if @like.user == current_user && @like.delete
  end
end
