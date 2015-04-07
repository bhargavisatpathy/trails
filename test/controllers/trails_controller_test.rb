require 'test_helper'

class Api::V1::TrailsControllerTest < ActionController::TestCase

  test "should get trails index" do
    get :index, format: :json

    data = JSON.parse(response.body)

    assert_response :success
    assert_kind_of Hash, data
  end

  test "should get trails show" do
    trail = Trail.create(name: "howdy hike", city: "Denver", state: "CO", country: "United States", lat: 10.323, lng: -103.23, description: "A darn good time", directions: "take a right")
    get :show, id: trail.id, format: :json

    data = JSON.parse(response.body)

    assert_response :success
    assert_kind_of Hash, data
  end

  test "trails have nested activities" do
    trail = Trail.create(name: "howdy hike", city: "Denver", state: "CO", country: "United States", lat: 10.323, lng: -103.23, description: "A darn good time", directions: "take a right")
    Activity.create(trail: trail, activity_type_name: "Hiking", url: "https://www.fun.com", activity_description: "walking")

    get :index, format: :json

    data = JSON.parse(response.body)

    assert_equal "howdy hike", data["trails"].last["name"]
    assert_equal "Hiking", data["trails"].last["activities"].last["activity_type_name"]
  end

  test "trails are paginated" do
    31.times { trail = Trail.create(name: "howdy hike", city: "Denver", state: "CO", country: "United States", lat: 10.323, lng: -103.23, description: "A darn good time", directions: "take a right")  
    Activity.create(trail: trail, activity_type_name: "Hiking", url: "https://www.fun.com", activity_description: "walking") }

    get :index, page: 2, format: :json

    data = JSON.parse(response.body)

    assert_response :success
    assert assigns(:trails)
    assert_equal 1, data.length
  end
end
