require "application_system_test_case"

class EnrolmentRequestsTest < ApplicationSystemTestCase
  setup do
    @enrolment_request = enrolment_requests(:one)
  end

  test "visiting the index" do
    visit enrolment_requests_url
    assert_selector "h1", text: "Enrolment Requests"
  end

  test "creating a Enrolment request" do
    visit enrolment_requests_url
    click_on "New Enrolment Request"

    fill_in "Batch", with: @enrolment_request.batch_id
    fill_in "Status", with: @enrolment_request.status
    fill_in "Student", with: @enrolment_request.student_id
    click_on "Create Enrolment request"

    assert_text "Enrolment request was successfully created"
    click_on "Back"
  end

  test "updating a Enrolment request" do
    visit enrolment_requests_url
    click_on "Edit", match: :first

    fill_in "Batch", with: @enrolment_request.batch_id
    fill_in "Status", with: @enrolment_request.status
    fill_in "Student", with: @enrolment_request.student_id
    click_on "Update Enrolment request"

    assert_text "Enrolment request was successfully updated"
    click_on "Back"
  end

  test "destroying a Enrolment request" do
    visit enrolment_requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Enrolment request was successfully destroyed"
  end
end
