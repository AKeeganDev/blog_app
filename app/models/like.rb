class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :increment_posts_likes_counter

  private

  def increment_posts_likes_counter
    posts.increment!(:likes_counter)
  end
end
