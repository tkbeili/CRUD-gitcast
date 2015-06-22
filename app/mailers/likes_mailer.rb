class LikesMailer < ApplicationMailer

  def notify_post_owner(like)
    @user = like.user
    @post = like.post
    mail(to: @post.user.email, subject: "#{@user.full_name} liked you post")
  end
end
