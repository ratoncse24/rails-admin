require 'test_helper'

class SlidersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @slider = sliders(:one)
  end

  test "should get index" do
    get sliders_url
    assert_response :success
  end

  test "should get new" do
    get new_slider_url
    assert_response :success
  end

  test "should create slider" do
    assert_difference('Slider.count') do
      post sliders_url, params: { slider: { description: @slider.description, status: @slider.status, title: @slider.title } }
    end

    assert_redirected_to slider_url(Slider.last)
  end

  test "should show slider" do
    get slider_url(@slider)
    assert_response :success
  end

  test "should get edit" do
    get edit_slider_url(@slider)
    assert_response :success
  end

  test "should update slider" do
    patch slider_url(@slider), params: { slider: { description: @slider.description, status: @slider.status, title: @slider.title } }
    assert_redirected_to slider_url(@slider)
  end

  test "should destroy slider" do
    assert_difference('Slider.count', -1) do
      delete slider_url(@slider)
    end

    assert_redirected_to sliders_url
  end
end
