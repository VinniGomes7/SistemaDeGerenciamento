require "test_helper"

class UsuarioTest < ActiveSupport::TestCase
  setup do
    @usuario = Usuario.create(username: "testuser", email: "test@example.com", password: "password123")
  end
  
  test "should not save usuario without username" do
    usuario = Usuario.new(email: "usuario@example.com", password: "password")
    assert_not usuario.save, "Saved the usuario without a username"
  end

  test "should not save usuario without email" do
    usuario = Usuario.new(username: "user", password: "password")
    assert_not usuario.save, "Saved the usuario without an email"
  end

  test "should update usuario" do
    usuario = Usuario.create(username: "user", email: "usuario@example.com", password: "password")
    usuario.update(username: "usuario_atualizado")
    assert_equal "usuario_atualizado", usuario.reload.username
  end

  test "should destroy usuario" do
    usuario = Usuario.create(username: "user", email: "usuario@example.com", password: "password")
    assert_difference("Usuario.count", -1) do
      usuario.destroy
    end
  end

  test "should find usuario by email" do
    usuario = Usuario.create(username: "user", email: "usuario@example.com", password: "password")
    found_usuario = Usuario.find_by(email: "usuario@example.com")
    assert_equal usuario.id, found_usuario.id
  end
end