require 'test_helper'

class SessionControllerTest < ActionController::TestCase
  
  setup do
    @request.env['HTTP_REFERER'] = root_url
  end

  test "should login" do
    foo = users(:one)
    post :create, nom: foo.nom, prenom:foo.prenom, password: '3210'
    assert_redirected_to user_url(foo)
    assert_equal foo.id, session[:user_id]
  end
  
  test "should fail login" do
    foo = users(:one)
    
    post :create, name: foo.nom, prenom:foo.prenom, password: '0123'
    assert_redirected_to root_url
  end
  
  test "should logout" do
    delete :destroy
    assert_redirected_to root_url
  end

end
