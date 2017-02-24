class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:create]

  def create
    comment_params   = params.require(:comment).permit(:body)
    @comment         = Comment.new comment_params
    @post            = Post.find params[:post_id]
    @comment.post    = @post

    if @comment.save
      redirect_to post_path(params[:post_id]), notice: 'Comment was successfully created'
    else
      flash[:alert] = 'You need to fix errors'
      render '/posts/show'
    end
  end



  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to post_path(@comment.post_id), notice: 'Comment was successfully deleted'
  end

    private

    def find_comment
    end

end
