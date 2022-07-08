class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :increment_posts_comments_counter

  private

  def increment_posts_comments_counter
    post.increment!(:comments_counter)
  end
end
