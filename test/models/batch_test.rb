require 'test_helper'

class BatchTest < ActiveSupport::TestCase
  def setup
    @school = School.create(name: "Test School")
    @course = Course.create(name: "Test Course", description: "Test Description", school_id: @school.id)
    @batch = Batch.create(name: "Test Batch", start_date: Date.today, end_date: Date.today + 1.month, course_id: @course.id)
  end

  test "batch should be valid" do
    assert @batch.valid?
  end

  test "name should be present" do
    @batch.name = "     "
    assert_not @batch.valid?
  end

  test "start_date should be present" do
    @batch.start_date = nil
    assert_not @batch.valid?
  end

  test "end_date should be present" do
    @batch.end_date = nil
    assert_not @batch.valid?
  end

  test "course_id should be present" do
    @batch.course_id = nil
    assert_not @batch.valid?
  end

  test "should have many students" do
    assert_respond_to @batch, :students
  end

  test "should belong to course" do
    assert_respond_to @batch, :course
    assert_equal @course, @batch.course
  end
end
