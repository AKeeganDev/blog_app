class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :title, presence: true
  validates :title, length: { maximum: 250, too_long: 'The maximum characters allowed for a Title is 250 characters' }
  validates :text, presence: true, length: { maximum: 4000 }
  validates :comments_counter, comparison: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, comparison: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :increment_user_posts_count

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def increment_user_posts_count
    user.increment!(:posts_counter)
  end
end
