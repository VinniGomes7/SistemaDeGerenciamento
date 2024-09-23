require "test_helper"

class UsuariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @usuario = Usuario.create(username: "testuser", email: "test@example.com", password: "password123")
  end  

  test "should list all usuarios" do
    get usuarios_url
    assert_response :success
    assert_select "h1", "Usuários"
  end

  test "should create usuario" do
    assert_difference("Usuario.count") do
      post usuarios_url, params: { usuario: { username: "novo_user", email: "novo@usuario.com", password: "password" } }
    end
    assert_redirected_to usuario_path(Usuario.last)
  end

  test "should show usuario" do
    get usuario_url(@usuario)
    assert_response :success
  end

  test "should update usuario" do
    patch usuario_url(@usuario), params: { usuario: { username: "atualizado" } }
    assert_redirected_to usuario_path(@usuario)
    @usuario.reload
    assert_equal "atualizado", @usuario.username
  end

  test "should destroy usuario" do
    assert_difference("Usuario.count", -1) do
      delete usuario_url(@usuario)
    end
    assert_redirected_to usuarios_path
  end
end