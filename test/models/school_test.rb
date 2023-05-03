require 'test_helper'

class SchoolTest < ActiveSupport::TestCase
  def setup
    @school = School.new(name: "Example School", address: "123 Main St.", 
                         phone_number: "555-1234", email: "example@school.com", 
                         website: "https://example.com")
  end

  test "should be valid" do
    assert @school.valid?
  end

  test "name should be present" do
    @school.name = "     "
    assert_not @school.valid?
  end

  test "address should be present" do
    @school.address = "     "
    assert_not @school.valid?
  end

  test "phone number should be present" do
    @school.phone_number = "     "
    assert_not @school.valid?
  end

  test "email should be present" do
    @school.email = "     "
    assert_not @school.valid?
  end

  test "website should be present" do
    @school.website = "     "
    assert_not @school.valid?
  end
end
