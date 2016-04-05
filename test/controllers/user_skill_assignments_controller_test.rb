require 'test_helper'

class UserSkillAssignmentsControllerTest < ActionController::TestCase
  setup do
    @user_skill_assignment = user_skill_assignments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_skill_assignments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_skill_assignment" do
    assert_difference('UserSkillAssignment.count') do
      post :create, user_skill_assignment: { level_id: @user_skill_assignment.level_id, skill_id: @user_skill_assignment.skill_id, user_id: @user_skill_assignment.user_id }
    end

    assert_redirected_to user_skill_assignment_path(assigns(:user_skill_assignment))
  end

  test "should show user_skill_assignment" do
    get :show, id: @user_skill_assignment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_skill_assignment
    assert_response :success
  end

  test "should update user_skill_assignment" do
    patch :update, id: @user_skill_assignment, user_skill_assignment: { level_id: @user_skill_assignment.level_id, skill_id: @user_skill_assignment.skill_id, user_id: @user_skill_assignment.user_id }
    assert_redirected_to user_skill_assignment_path(assigns(:user_skill_assignment))
  end

  test "should destroy user_skill_assignment" do
    assert_difference('UserSkillAssignment.count', -1) do
      delete :destroy, id: @user_skill_assignment
    end

    assert_redirected_to user_skill_assignments_path
  end
end
