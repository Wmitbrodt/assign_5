class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]


  def create
    comment_params   = params.require(:comment).permit(:body)
    @comment         = Comment.new comment_params
    @post            = Post.find params[:post_id]
    @comment.user = current_user
    @comment.post    = @post


    if @comment.save
      PostsMailer.notify_post_owner(@comment).deliver_later
      redirect_to post_path(params[:post_id]), notice: 'Comment was successfully created'
    else
      flash.now[:alert] = 'You need to fix errors'
      render '/posts/show'
    end
  end



  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to post_path(@comment.post_id), notice: 'Comment was successfully deleted'
  end

    private

    def authorize
    @comment = Comment.find params[:id]

    if cannot?(:manage, @comment)
      redirect_to post_path(@comment.post_id),notice:'You can\'t delete this!'
    end
  end

end
