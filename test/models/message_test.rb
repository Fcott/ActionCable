require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  def setup
    @message = users(:example).messages.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @message.valid?, @message.errors.full_messages
  end

  test "should not be blank" do
    @message.content = " "
    assert !@message.valid?
  end

  test "mentions" do
    @message.content = "This mentions @example and @nonexistent"
    assert @message.mentions.include?(users(:example))
    # assert_not @message.mentions.include?(users(:nonexistent))
  end
end
