require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'validate login' do
    assert User.email != ""
  end
  test 'validate password' do
    assert User.password != ""
  end
end
