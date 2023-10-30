# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @posts = Post.includes(:creator, :likes).order(created_at: :desc)
  end

  def show
    @post = Post.eager_load(:category, :creator, :likes, :comments).find(params[:id])
    @like = @post.likes.find_by(user: current_user)
    @new_comment = PostComment.new
    @comments = @post.comments.order(created_at: :desc).eager_load(:user).arrange(order: { id: :desc })
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.created_posts.build(post_params)

    if @post.save
      redirect_to post_url(@post), notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
