class PostsMailer < ApplicationMailer

  def notify_post_owner(comment)
    @comment = comment
    @post    = comment.post
    @owner   = @post.user
      if @owner.present?
      mail(to: 'wmitbrodt@gmail.com', subject: 'You have a new comment on your post')
    end
  end

end
