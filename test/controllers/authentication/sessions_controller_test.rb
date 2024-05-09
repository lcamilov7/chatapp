require "test_helper"

class Authentication::SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:sara)
  end

  test 'shoul get new session' do
    get new_authentication_session_url
    assert_response(:success)
  end

  test 'should create a session' do
    post authentication_sessions_url, params: {
      username: @user.username,
      password: 'testme'
    }
  end
end
