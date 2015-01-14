require 'test_helper'

class OccasionsControllerTest < ActionController::TestCase
  setup do
    @occasion = occasions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:occasions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create occasion" do
    assert_difference('Occasion.count') do
      post :create, occasion: { name: @occasion.name }
    end

    assert_redirected_to occasion_path(assigns(:occasion))
  end

  test "should show occasion" do
    get :show, id: @occasion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @occasion
    assert_response :success
  end

  test "should update occasion" do
    patch :update, id: @occasion, occasion: { name: @occasion.name }
    assert_redirected_to occasion_path(assigns(:occasion))
  end

  test "should destroy occasion" do
    assert_difference('Occasion.count', -1) do
      delete :destroy, id: @occasion
    end

    assert_redirected_to occasions_path
  end
end
