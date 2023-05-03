require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  def setup
    @school = School.create(name: 'Test School', address: '123 Test St', phone_number: '555-555-5555')
    @course = @school.courses.create(name: 'Test Course', description: 'This is a test course')
  end

  test "should be valid" do
    assert @course.valid?
  end

  test "name should be present" do
    @course.name = "   "
    assert_not @course.valid?
  end

  test "name should not be too long" do
    @course.name = "a" * 51
    assert_not @course.valid?
  end

  test "description should be present" do
    @course.description = "   "
    assert_not @course.valid?
  end

  test "description should not be too long" do
    @course.description = "a" * 1001
    assert_not @course.valid?
  end

  test "school should be present" do
    @course.school_id = nil
    assert_not @course.valid?
  end

  test "should have many batches" do
    assert_respond_to @course, :batches
  end
end
