# frozen_string_literal: true

module Posts
  class LikesController < Posts::ApplicationController
    def create
      @like = @post.likes.build(user_id: current_user.id)

      redirect_to @post if @like.save
    end

    def destroy
      @like = PostLike.find params[:id]

      if @like.user == current_user && @like.delete
        redirect_to @post
      else
        redirect_to @post, alert: t('.alert')
      end
    end
  end
end
