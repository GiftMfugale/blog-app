require "test_helper"

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'title should be present' do
    post = Post.new
    assert_not post.valid?, 'Post should  be invalid without a title'
  end

  test 'title should not be too long' do
    post = Post.new(title: 'a' * 251)
    assert_not post.valid?, 'Post should be invalid with a title longer than 250 characters'
  end

  test 'comment counter  should be  an integer greater than or equal to 0' do
    post = Post.new(comments_counter: -1)
    assert_not post.valid?, 'Post should be invalid with a negative comments_counter'

    post.comments_counter = 0
    assert post.valid?, 'Post should be valid with a comments counter of 0'

    post.comments_counter = 10 
    assert post.valid?, 'Post should be valid with positive comments counter'
  end

  test 'likes counter should be an integer greater than or equal to 0' do
    post = Post.new(likes_counter: -1)
    assert_not post.valid?, 'Post should be invalid with a negative likes counters'

    post.likes_counter = 0
    assert post.valid?, 'Post should be valid with likes counter of 0'

    post.likes_counter = 10
    assert post.valid?, 'Post should be valid with a positive likes counter'
  end

  test 'should return the five most recent comments' do
    
  end
end
