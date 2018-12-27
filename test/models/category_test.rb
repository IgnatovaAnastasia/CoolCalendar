require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'validate_name' do
    assert Category.name != ''
  end
end
