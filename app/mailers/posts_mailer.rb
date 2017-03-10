class PostsMailer < ApplicationMailer

  def notify_post_owner
    mail(to: 'wmitbrodt@gmail.com', subject: 'test')
  end

end
