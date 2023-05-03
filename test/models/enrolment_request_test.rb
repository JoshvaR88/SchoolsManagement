require 'test_helper'

class EnrolmentRequestTest < ActiveSupport::TestCase
  def setup
    @student = Student.create(name: 'John Doe', email: 'john.doe@example.com', phone_number: '1234567890')
    @school = School.create(name: 'Test School', address: '123 Test St.', phone_number: '1234567890')
    @course = Course.create(name: 'Test Course', description: 'This is a test course.', school_id: @school.id)
    @batch = Batch.create(name: 'Test Batch', start_date: Date.today, end_date: Date.tomorrow, course_id: @course.id)
  end

  test 'should create enrolment request' do
    enrolment_request = EnrolmentRequest.create(student_id: @student.id, batch_id: @batch.id)

    assert enrolment_request.valid?
    assert_equal @student, enrolment_request.student
    assert_equal @batch, enrolment_request.batch
  end

  test 'should not create enrolment request without student_id' do
    enrolment_request = EnrolmentRequest.create(batch_id: @batch.id)

    assert_not enrolment_request.valid?
    assert_equal ["can't be blank"], enrolment_request.errors.messages[:student]
  end

  test 'should not create enrolment request without batch_id' do
    enrolment_request = EnrolmentRequest.create(student_id: @student.id)

    assert_not enrolment_request.valid?
    assert_equal ["can't be blank"], enrolment_request.errors.messages[:batch]
  end

  test 'should not create enrolment request with invalid status' do
    enrolment_request = EnrolmentRequest.create(student_id: @student.id, batch_id: @batch.id, status: 'invalid')

    assert_not enrolment_request.valid?
    assert_equal ["is not included in the list"], enrolment_request.errors.messages[:status]
  end
end
