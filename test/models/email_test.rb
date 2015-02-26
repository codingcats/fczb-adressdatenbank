require 'test_helper'

class EmailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "email heinz@buschkows.ky is valid" do
  	email = Email.new(value: "heinz@buschkows.ky")
  	assert email.valid?
  end

  test "email huhu@huhu is invalid" do
  	email = Email.new(value: "huhu@huhu")
  	assert_not email.valid?
  end
end
