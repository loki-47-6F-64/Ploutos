require 'test_helper'

class TypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "create type attr name" do
    @type = Type.new
    refute @type.save, 'Saved while name blanc'

    @type.name = "test"
    assert @type.save, "Not saved while name not blanc"
  end
end
