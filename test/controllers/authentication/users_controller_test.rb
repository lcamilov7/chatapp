require "test_helper"

class Authentication::UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get new user' do
    get new_authentication_user_url
    assert_response(:success)
    assert_select('form', 1)
  end

  test 'should create an user' do
    assert_difference('User.count') do
      post authentication_users_url, params: {
        user: {
          username: 'pepito23',
          password: 'testme444444'
        }
      }
    end
    assert_redirected_to(new_authentication_user_url)
  end

  test 'should not allow to create user with missing attribute' do
    assert_difference('User.count', 0) do
      post authentication_users_url, params: {
        user: {
          username: nil,
          password: 'testme444444'
        }
      }
    end
    assert_response(:unprocessable_entity)
  end

  test 'should not allow to create user with wrong format attribute' do
    assert_difference('User.count', 0) do
      post authentication_users_url, params: {
        user: {
          username: 'UIS UARIO @@ ',
          password: 'testme444444'
        }
      }
    end
    assert_response(:unprocessable_entity)
  end
end
