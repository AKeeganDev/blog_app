class post_representer.rb
  def initialize(posts)
    @posts = posts
  end

  private
  attr_reader :posts
end