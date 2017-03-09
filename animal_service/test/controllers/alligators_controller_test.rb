require 'test_helper'

class AlligatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alligator = alligators(:one)
  end

  test "should get index" do
    get alligators_url
    assert_response :success
  end

  test "should get new" do
    get new_alligator_url
    assert_response :success
  end

  test "should create alligator" do
    assert_difference('Alligator.count') do
      post alligators_url, params: { alligator: { name: @alligator.name } }
    end

    assert_redirected_to alligator_url(Alligator.last)
  end

  test "should show alligator" do
    get alligator_url(@alligator)
    assert_response :success
  end

  test "should get edit" do
    get edit_alligator_url(@alligator)
    assert_response :success
  end

  test "should update alligator" do
    patch alligator_url(@alligator), params: { alligator: { name: @alligator.name } }
    assert_redirected_to alligator_url(@alligator)
  end

  test "should destroy alligator" do
    assert_difference('Alligator.count', -1) do
      delete alligator_url(@alligator)
    end

    assert_redirected_to alligators_url
  end
end
