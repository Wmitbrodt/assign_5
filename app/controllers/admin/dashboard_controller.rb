class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize

  def index
    @post_count    = Post.count
    @comment_count = Comment.comment.count
    @user_count    = User.count
  end

    


end
