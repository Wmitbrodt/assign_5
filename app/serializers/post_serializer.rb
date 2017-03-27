class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :created_on, :user_name

  has_many :comments

  def created_on
    # in this case `object` refers to the post object we're serializing
    # (coverting to JSON)
    object.created_at.strftime('%Y-%B-%d')
  end

  def user_name
    object.user&.full_name
  end
end
