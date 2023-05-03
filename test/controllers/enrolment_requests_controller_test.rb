require 'test_helper'

class EnrolmentRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enrolment_request = enrolment_requests(:one)
  end

  test "should get index" do
    get enrolment_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_enrolment_request_url
    assert_response :success
  end

  test "should create enrolment_request" do
    assert_difference('EnrolmentRequest.count') do
      post enrolment_requests_url, params: { enrolment_request: { batch_id: @enrolment_request.batch_id, status: @enrolment_request.status, student_id: @enrolment_request.student_id } }
    end

    assert_redirected_to enrolment_request_url(EnrolmentRequest.last)
  end

  test "should show enrolment_request" do
    get enrolment_request_url(@enrolment_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_enrolment_request_url(@enrolment_request)
    assert_response :success
  end

  test "should update enrolment_request" do
    patch enrolment_request_url(@enrolment_request), params: { enrolment_request: { batch_id: @enrolment_request.batch_id, status: @enrolment_request.status, student_id: @enrolment_request.student_id } }
    assert_redirected_to enrolment_request_url(@enrolment_request)
  end

  test "should destroy enrolment_request" do
    assert_difference('EnrolmentRequest.count', -1) do
      delete enrolment_request_url(@enrolment_request)
    end

    assert_redirected_to enrolment_requests_url
  end
end
