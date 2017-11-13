require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end
  
  test "unsuccessful edit" do
    log_in as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { name: '',
                                    email: 'foo@invalid',
                                    password: 'foo',
                                    password_confirmation: 'bar'}
    assert_template 'users/edit'
  end
  
  test  "successful edit" do
    log_in(@user)
    get edit_user_path(@user)
  end
end
