require 'test_helper'

class Api::V1::Trails::TrailsControllerTest < ActionController::TestCase

  test "should get trails index" do
    get :index

    data = JSON.parse(response.body)

    assert_response :success
    assert_kind_of Hash, data
  end

  test "should get trails show" do
    trail = Trail.create(name: "howdy hike", city: "Denver", state: "CO", country: "United States", lat: 10.323, lng: -103.23, description: "A darn good time", directions: "take a right" )
    get :show, id: trail.id

    data = JSON.parse(response.body)

    assert_response :success
    assert_kind_of Hash, data
  end
end
