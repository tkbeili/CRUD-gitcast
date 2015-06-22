class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    like      = current_user.likes.new
    post      = Post.find params[:post_id]
    like.post = post
    if like.save
      LikesMailer.notify_post_owner(like).deliver_now
      redirect_to post, notice: "Liked!"
    else
      redirect_to post, alert: "Can't Like!"
    end
  end

  def destroy
    like = current_user.likes.find params[:id]
    like.destroy
    redirect_to like.post, notice: "Unliked"
  end

end
