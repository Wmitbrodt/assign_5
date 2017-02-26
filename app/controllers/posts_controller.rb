class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action( :authorize, only: [:edit, :destroy, :update])

  def new
    @post = Post.new(created_at: :desc)
  end

  def create
    post_params = params.require(:post).permit([:title, :body, :category_id])
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      flash[:notice] = "Post Created"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = 'Please fix errors below'

      render :new
    end
  end

  def show
    @post = Post.find params[:id]
    @comment = Comment.new

  end

  def index
    @post = Post.order(created_at: :desc)
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    post_params = params.require(:post).permit([:title, :body, :category_id])
    if @post.update post_params
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find params[:id]
    post.destroy
    redirect_to posts_path
  end

    private

    def authorize
      if cannot?(:manage, @post)
        redirect_to root_path, alert: 'Not authorized!'
      end
    end

end
