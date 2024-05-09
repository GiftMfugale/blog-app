require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'name should be present' do
    user = User.new
    assert_not user.valid?, 'User shoulf be invalid without a name'
  end
end
