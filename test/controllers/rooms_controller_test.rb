require "test_helper"

class RoomsControllerTest < ActionDispatch::IntegrationTest
  def setup
    login
  end

  test 'should render index of rooms' do
    get rooms_url
    assert_response(:success)
  end
end
