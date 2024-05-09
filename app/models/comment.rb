class Comment < ApplicationRecord
  belongs_to :post, counter_cache: :comments_counter
  belongs_to :user

  after_create :increment_post_comment_count
  after_destroy :decrement_post_comment_count

  def commented_by
    user.name
  end

  private

  def increment_post_comment_count
    post.increment!(:comments_counter)
  end

  def decrement_post_comment_count
    post.decrement!(:comments_counter)
  end
end
