class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post_params = params.require(:post).permit(:title, :body)
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "Post Created"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    post_params = params.require(:post).permit(:title, :body)
    if @post.update post_params
      redirect_to post_path(@post), notice: "Post Updated"
    else
      render :edit
    end
  end

  private

  def find_post
    @post = Post.find params[:id]
  end

end
