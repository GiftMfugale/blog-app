class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: :likes_counter

  after_create :increment_post_like_count
  after_destroy :decrement_post_like_count

  private

  def increment_post_like_count
    post.increment!(:likes_counter)
  end

  def decrement_post_like_count
    post.decrement!(:likes_counter)
  end

end
