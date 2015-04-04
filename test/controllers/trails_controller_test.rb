require 'test_helper'

class Api::V1::Trails::TrailsControllerTest < ActionController::TestCase

  test "should get index" do

    get :index

    data = JSON.parse(response.body)
    assert_response :success
    assert_kind_of Hash, data
  end
end
