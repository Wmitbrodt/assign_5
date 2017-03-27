json.more_posts @more_posts

# this generates a JSON array as the main element
json.posts @posts do |post|
  json.id post.id

  # json.title will generate a key called `title` in an object within the main
  # array. The value will be `@post.title`
  json.title post.title

  json.created_on post.created_at.strftime('%Y-%B-%d')

  json.url api_v1_post_path(post)
end
