require "test_helper"

class VagaTest < ActiveSupport::TestCase
  setup do
    @empregador = Empregador.create(nome: "Empresa XYZ", email: "empregador@example.com")
    @vaga = Vaga.create(title: "Teste", description: "Descrição da vaga", empregador: @empregador)
  end

  test "deve criar vaga" do
    assert_difference("Vaga.count", 1) do
      Vaga.create(title: "Nova Vaga", description: "Descrição da nova vaga", empregador: @empregador)
    end
  end  

  test "deve atualizar vaga" do
    @vaga.update(title: "Vaga Atualizada")
    assert_equal "Vaga Atualizada", @vaga.title
  end

  test "deve destruir vaga" do
    assert_difference("Vaga.count", -1) do
      @vaga.destroy
    end
  end

  test "não deve salvar vaga sem título" do
    vaga = Vaga.new(description: "Descrição da vaga", empregador: @empregador)
    assert_not vaga.save, "A vaga foi salva sem um título"
  end

  test "não deve salvar vaga sem descrição" do
    vaga = Vaga.new(title: "Desenvolvedor", empregador: @empregador)
    assert_not vaga.save, "A vaga foi salva sem uma descrição"
  end

  test "deve encontrar vaga pelo título" do
    vaga = Vaga.create(title: "Desenvolvedor", description: "Descrição da vaga", empregador: @empregador)
    found_vaga = Vaga.find_by(title: "Desenvolvedor")
    assert_equal vaga.id, found_vaga.id
  end  
end