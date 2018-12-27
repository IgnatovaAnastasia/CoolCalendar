require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'validate name' do
    assert Event.name != ""
  end
end
