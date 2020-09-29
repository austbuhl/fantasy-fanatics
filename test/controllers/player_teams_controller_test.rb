require 'test_helper'

class PlayerTeamsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get player_teams_new_url
    assert_response :success
  end

end
