class Api::V1::PostsController < Api::BaseController
  
  PER_PAGE = 10

  def index
    current_page   = params.fetch(:page, 0).to_i
    offset         = PER_PAGE * current_page

    @post = Post.order(created_at: :desc)
                         .limit(PER_PAGE)
                         .offset(offset)

    @more_post = (Post.count - ((current_page + 1) * PER_PAGE)) > 0
    # This will use the built-in `to_json` method that comes with Rails which
    # sends all the attributes without associations
    # render json: @qpost.to_json

    # This will use ActiveModel Serializer class: PostSerializer which, as
    # we defined it, will serve the post with answers the it will include
    # the creator name.
    # render json: @qpost

    # the default behaviour is to render `index.json.jbuilder` which will render
    # JSON as we defined it in the `/app/views/api/v1/qpost/index.json.jbuilder`
  end

  def show
    post = Post.find params[:id]

    # in we have ActiveModel Serializer set up for the  Post model then when
    # we invoke `render json: post` it will use the ActiveModel Serializer
    # class to render the json instead of the default `to_json` that is built-in
    # with Rails
    render json: post
  end

  def create
    post_params = params.require(:post).permit(:title, :body)
    post        =  Post.new post_params
    post.user   = @user
    if post.save
      render json: { id: post.id }
    else
      render json: { errors: post.errors.full_messages }
    end
  end

end
