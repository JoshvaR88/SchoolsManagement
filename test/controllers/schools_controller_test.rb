require 'test_helper'

class SchoolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school = schools(:one)
  end

  test "should get index" do
    get schools_url
    assert_response :success
  end

  test "should get new" do
    get new_school_url
    assert_response :success
  end

  test "should create school" do
    assert_difference('School.count') do
      post schools_url, params: { school: { address: @school.address, email: @school.email, name: @school.name, phone_number: @school.phone_number, website: @school.website } }
    end

    assert_redirected_to school_url(School.last)
  end

  test "should show school" do
    get school_url(@school)
    assert_response :success
  end

  test "should get edit" do
    get edit_school_url(@school)
    assert_response :success
  end

  test "should update school" do
    patch school_url(@school), params: { school: { address: @school.address, email: @school.email, name: @school.name, phone_number: @school.phone_number, website: @school.website } }
    assert_redirected_to school_url(@school)
  end

  test "should destroy school" do
    assert_difference('School.count', -1) do
      delete school_url(@school)
    end

    assert_redirected_to schools_url
  end

  def setup
    @user = users(:school_admin) # Assuming there is a school admin user fixture in the test database
    @secret = Rails.application.secrets.secret_key_base # Or you can define your own secret key for the test environment
  end

  test "should get index with JWT token" do
    payload = { user_id: @user.id }
    token = JWT.encode payload, @secret, 'HS256'

    get schools_url, headers: { 'Authorization' => "Bearer #{token}" }
    assert_response :success
  end
end
