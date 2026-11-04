require 'test_helper'

class PersonaTest < ActiveSupport::TestCase
  test "fixtures are wired together" do
    assert_equal personas(:alec), guns(:combat).persona
    assert_equal members(:wayne), personas(:alec).member
  end
end
