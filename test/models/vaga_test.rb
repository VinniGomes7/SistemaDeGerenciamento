require "test_helper"

class VagaTest < ActiveSupport::TestCase
  setup do
    @empregador = Empregador.create(nome: "Empresa XYZ", email: "empregador@example.com")
    @vaga = Vaga.create(title: "Teste", description: "Descrição da vaga", empregador: @empregador)
  end

  test "should create vaga" do
    assert_difference("Vaga.count", 1) do
      Vaga.create(title: "Nova Vaga", description: "Descrição da nova vaga", empregador: @empregador)
    end
  end  

  test "should update vaga" do
    @vaga.update(title: "Vaga Atualizada")
    assert_equal "Vaga Atualizada", @vaga.title
  end

  test "should destroy vaga" do
    assert_difference("Vaga.count", -1) do
      @vaga.destroy
    end
  end

  test "should not save vaga without title" do
    vaga = Vaga.new(description: "Descrição da vaga", empregador: @empregador)
    assert_not vaga.save, "Saved the vaga without a title"
  end

  test "should not save vaga without description" do
    vaga = Vaga.new(title: "Desenvolvedor", empregador: @empregador)
    assert_not vaga.save, "Saved the vaga without a description"
  end

  test "should find vaga by title" do
    vaga = Vaga.create(title: "Desenvolvedor", description: "Descrição da vaga", empregador: @empregador)
    found_vaga = Vaga.find_by(title: "Desenvolvedor")
    assert_equal vaga.id, found_vaga.id
  end  
end