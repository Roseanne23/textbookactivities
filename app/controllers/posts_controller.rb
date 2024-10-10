class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to posts_path
    else
      flash.now[:alert] = 'Post was not created.'
    end
  end

  def show; end

  def edit; end

  def update
    flash[:notice] = 'Post was successfully updated.'
    if @post.update(post_params)
      redirect_to posts_path
    flash.now[:alert] = 'Post update failed'
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
  def set_comment
    @comment = @post.comments.find(params[:id])
  end
end