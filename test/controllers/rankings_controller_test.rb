require 'test_helper'

class RankingsControllerTest < ActionDispatch::IntegrationTest
  test "should get good" do
    get rankings_good_url
    assert_response :success
  end

end
