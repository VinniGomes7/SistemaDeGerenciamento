require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @usuario = Usuario.create(nome: "Teste", email: "teste@example.com", username: "testuser", password: "password")
  end

  test "should get new" do
    get new_session_path
    assert_response :success
  end

  test "should create session" do
    post login_path, params: { session: { login: @usuario.email, password: 'password' } }
    assert_redirected_to root_path
    assert_not_nil session[:user_id]
  end

  test "should not create session with invalid credentials" do
    post login_path, params: { session: { login: @usuario.email, password: 'wrongpassword' } }
    assert_template :new
    assert_nil session[:user_id]
  end

  test "should destroy session" do
    post login_path, params: { session: { login: @usuario.email, password: 'password' } }
    delete logout_path
    assert_redirected_to new_session_path
    assert_nil session[:user_id]
  end
end