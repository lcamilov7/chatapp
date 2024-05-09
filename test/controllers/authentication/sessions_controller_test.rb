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
    assert_equal(session[:user_id], @user.id)
  end

  test 'should destroy a session' do
    login
    delete authentication_session_url(@user.id)
    assert_nil(session[:user_id])
    assert_redirected_to(new_authentication_session_url)
  end
end
