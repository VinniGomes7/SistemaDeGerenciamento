require "test_helper"

class EmpregadorTest < ActiveSupport::TestCase
  test "should not save empregador without name" do
    empregador = Empregador.new(email: "empregador@example.com")
    assert_not empregador.save, "Saved the empregador without a name"
  end

  test "should not save empregador without email" do
    empregador = Empregador.new(nome: "Empresa XYZ")
    assert_not empregador.save, "Saved the empregador without an email"
  end

  test "should update empregador" do
    empregador = Empregador.create(nome: "Empresa XYZ", email: "empregador@example.com")
    empregador.update(nome: "Empresa Atualizada")
    assert_equal "Empresa Atualizada", empregador.reload.nome
  end

  test "should destroy empregador" do
    empregador = Empregador.create(nome: "Empresa XYZ", email: "empregador@example.com")
    assert_difference("Empregador.count", -1) do
      empregador.destroy
    end
  end

  test "should find empregador by email" do
    empregador = Empregador.create(nome: "Empresa XYZ", email: "empregador@example.com")
    found_empregador = Empregador.find_by(email: "empregador@example.com")
    assert_equal empregador.id, found_empregador.id
  end
end