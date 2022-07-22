class PostRepresenter
  def initialize(posts)
    @posts = posts
  end

  def as_json
    {
      code: 200,
      success: true,
      message: 'Successfully loaded all posts',
      data:
        { posts:
            @posts.map do |post|
              p post
              {
                id: post.id,
                title: post.title,
                username: post.user.name,
                text: post.text
              }
            end },
      status: :ok
    }
  end

  private

  attr_reader :posts
end
