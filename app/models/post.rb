class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: :posts_counter
  has_many :comments, dependent: :destroy, counter_cache: :comments_counter
  has_many :likes, dependent: :destroy

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  # validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :increment_user_post_counter
  after_destroy :decrement_user_post_counter
  
  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def increment_user_post_counter
    author.increment!(:posts_counter)
  end

  def decrement_user_post_counter
    author.decrement!(:posts_counter)
  end
end
