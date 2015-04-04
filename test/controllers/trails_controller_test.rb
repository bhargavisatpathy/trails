require 'test_helper'

class Api::V1::Trails::TrailsControllerTest < ActionController::TestCase

  test "should get trails index" do

    get :index

    data = JSON.parse(response.body)
    assert_response :success
    assert_kind_of Hash, data
  end

  test "should get trails show" do
    skip
    trail = Trail.create()
    get :show, id: id

    data = JSON.parse(response.body)
    assert_response :success
    assert_kind_of Hash, data
  end
end
