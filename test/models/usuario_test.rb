require "test_helper"

class UsuarioTest < ActiveSupport::TestCase
  setup do
    @usuario = Usuario.create(nome: "testuser", email: "test@example.com", password: "password123", username: "testuser")
  end
  
  test "should not save usuario without nome" do
    usuario = Usuario.new(email: "usuario@example.com", password: "password", username: "usuario")
    assert_not usuario.save, "Saved the usuario without a nome"
  end

  test "should not save usuario without email" do
    usuario = Usuario.new(nome: "user", password: "password", username: "usuario")
    assert_not usuario.save, "Saved the usuario without an email"
  end

  test "should update usuario" do
    usuario = Usuario.create(nome: "user", email: "usuario@example.com", password: "password", username: "usuario")
    usuario.update(nome: "usuario_atualizado")
    assert_equal "usuario_atualizado", usuario.reload.nome
  end

  test "should destroy usuario" do
    usuario = Usuario.create(nome: "user", email: "usuario@example.com", password: "password", username: "usuario")
    assert_difference("Usuario.count", -1) do
      usuario.destroy
    end
  end

  test "should find usuario by email" do
    usuario = Usuario.create(nome: "user", email: "usuario@example.com", password: "password", username: "usuario")
    found_usuario = Usuario.find_by(email: "usuario@example.com")
    assert_equal usuario.id, found_usuario.id
  end
end