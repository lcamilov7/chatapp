require "test_helper"

class RoomsControllerTest < ActionDispatch::IntegrationTest
  def setup
    login
  end

  test 'should render index of rooms' do
    get rooms_url
    assert_response(:success)
  end

  test 'should create a room' do
    assert_difference('Room.count') do
      post rooms_url, params: {
        room: {
          name: 'Júlbol'
        }
      }
    end
  end
end
