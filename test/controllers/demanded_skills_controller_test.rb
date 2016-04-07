require 'test_helper'

class DemandedSkillsControllerTest < ActionController::TestCase
  setup do
    @demanded_skill = demanded_skills(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:demanded_skills)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create demanded_skill" do
    assert_difference('DemandedSkill.count') do
      post :create, demanded_skill: { created_at: @demanded_skill.created_at, employer_user_id: @demanded_skill.employer_user_id, level: @demanded_skill.level_id , skill_id: @demanded_skill.skill_id }
    end

    assert_redirected_to demanded_skill_path(assigns(:demanded_skill))
  end

  test "should show demanded_skill" do
    get :show, id: @demanded_skill
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @demanded_skill
    assert_response :success
  end

  test "should update demanded_skill" do
    patch :update, id: @demanded_skill, demanded_skill: { created_at: @demanded_skill.created_at, employer_user_id: @demanded_skill.employer_user_id, level: @demanded_skill.level_id, skill_id: @demanded_skill.skill_id }
    assert_redirected_to demanded_skill_path(assigns(:demanded_skill))
  end

  test "should destroy demanded_skill" do
    assert_difference('DemandedSkill.count', -1) do
      delete :destroy, id: @demanded_skill
    end

    assert_redirected_to demanded_skills_path
  end
end
