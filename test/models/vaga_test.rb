require "test_helper"

class VagaTest < ActiveSupport::TestCase
  setup do
    @empregador = Empregador.create(nome: "Empresa XYZ", email: "empregador@example.com")
    @vaga = Vaga.create(titulo: "Teste", descricao: "Descrição da vaga", empregador: @empregador)
  end

  test "should create vaga" do
    @empregador = Empregador.create(nome: "Empresa XYZ", email: "empregador@example.com")
    assert_difference("Vaga.count", 1) do
      Vaga.create(titulo: "Nova Vaga", descricao: "Descrição da nova vaga", empregador: @empregador)
    end
  end  

  test "should update vaga" do
    @vaga.update(titulo: "Vaga Atualizada")
    assert_equal "Vaga Atualizada", @vaga.titulo
  end

  test "should destroy vaga" do
    assert_difference("Vaga.count", -1) do
      @vaga.destroy
    end
  end

  test "should not save vaga without title" do
    vaga = Vaga.new(descricao: "Descrição da vaga")
    assert_not vaga.save, "Saved the vaga without a title"
  end

  test "should not save vaga without description" do
    vaga = Vaga.new(titulo: "Desenvolvedor")
    assert_not vaga.save, "Saved the vaga without a description"
  end

  test "should find vaga by title" do
    @empregador = Empregador.create(nome: "Empresa XYZ", email: "empregador@example.com")
    vaga = Vaga.create(titulo: "Desenvolvedor", descricao: "Descrição da vaga", empregador: @empregador)
    found_vaga = Vaga.find_by(titulo: "Desenvolvedor")
    assert_equal vaga.id, found_vaga.id
  end  
end