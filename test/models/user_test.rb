require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Beispiel Nutzerin", username: "exampline")
    end
  
#  test "should be valid" do
 #   assert @user.valid?
  #  end
  
#  test "name should be present" do
 #   @user.name = "     "
  #  assert_not @user.valid?
  #end
  
end
