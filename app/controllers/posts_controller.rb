class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    post_params = params.require(:post).permit(:title, :body)
    @post = Post.new(post_params)
    @post.save
    redirect_to posts_path, notice: "Post Created"
  end

end
