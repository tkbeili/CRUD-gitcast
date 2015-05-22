class PostsController < ApplicationController

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

end
