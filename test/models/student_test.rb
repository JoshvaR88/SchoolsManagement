require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  test "should not save student without name" do
    student = Student.new
    assert_not student.save, "Saved the student without a name"
  end

  test "should not save student without email" do
    student = Student.new(name: "John Doe")
    assert_not student.save, "Saved the student without an email"
  end

  test "should not save student with duplicate email" do
    student1 = Student.create(name: "John Doe", email: "johndoe@example.com")
    student2 = Student.new(name: "Jane Doe", email: "johndoe@example.com")
    assert_not student2.save, "Saved the student with a duplicate email"
  end

  test "should save student with required attributes" do
    school = School.create(name: "Test School", address: "123 Main St", phone_number: "555-1234")
    course = Course.create(name: "Test Course", description: "A test course", school: school)
    batch = Batch.create(name: "Test Batch", start_date: Date.today, end_date: Date.today + 6.months, course: course)
    student = Student.new(name: "John Doe", email: "johndoe@example.com", batch: batch)
    assert student.save, "Could not save the student with required attributes"
  end

  test "should belong to a batch" do
    school = School.create(name: "Test School", address: "123 Main St", phone_number: "555-1234")
    course = Course.create(name: "Test Course", description: "A test course", school: school)
    batch = Batch.create(name: "Test Batch", start_date: Date.today, end_date: Date.today + 6.months, course: course)
    student = Student.new(name: "John Doe", email: "johndoe@example.com", batch: batch)
    assert_equal batch, student.batch, "Student does not belong to the correct batch"
  end
end
