# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

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

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
