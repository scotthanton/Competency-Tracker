require 'test_helper'

class PrerequisitsControllerTest < ActionController::TestCase
  setup do
    @prerequisit = prerequisits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prerequisits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prerequisit" do
    assert_difference('Prerequisit.count') do
      post :create, prerequisit: { prerequisit_skill_id: @prerequisit.prerequisit_skill_id, skill_id: @prerequisit.skill_id }
    end

    assert_redirected_to prerequisit_path(assigns(:prerequisit))
  end

  test "should show prerequisit" do
    get :show, id: @prerequisit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prerequisit
    assert_response :success
  end

  test "should update prerequisit" do
    patch :update, id: @prerequisit, prerequisit: { prerequisit_skill_id: @prerequisit.prerequisit_skill_id, skill_id: @prerequisit.skill_id }
    assert_redirected_to prerequisit_path(assigns(:prerequisit))
  end

  test "should destroy prerequisit" do
    assert_difference('Prerequisit.count', -1) do
      delete :destroy, id: @prerequisit
    end

    assert_redirected_to prerequisits_path
  end
end
