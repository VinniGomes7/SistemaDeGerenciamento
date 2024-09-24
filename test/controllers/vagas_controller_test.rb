require "test_helper"

class VagasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empregador = Empregador.create(nome: "Empresa XYZ", email: "empregador@example.com")
    @vaga = Vaga.create(title: "Desenvolvedor", description: "Descrição da vaga", empregador: @empregador)
  end

  test "deve listar todas as vagas" do
    get vagas_url
    assert_response :success
    assert_select "h1", "Vagas"
  end

  test "deve criar vaga" do
    assert_difference("Vaga.count", 1) do
      post vagas_url, params: { vaga: { title: "Nova Vaga", description: "Descrição da nova vaga", empregador_id: @empregador.id } }
    end
    assert_redirected_to vaga_path(Vaga.last)
  end

  test "deve mostrar vaga" do
    get vaga_url(@vaga)
    assert_response :success
    assert_select "h1", @vaga.title  
  end

  test "deve atualizar vaga" do
    patch vaga_url(@vaga), params: { vaga: { title: "Atualizado" } }
    assert_redirected_to vaga_path(@vaga)
    @vaga.reload
    assert_equal "Atualizado", @vaga.title
  end

  test "deve destruir vaga" do
    assert_difference("Vaga.count", -1) do
      delete vaga_url(@vaga)
    end
    assert_redirected_to vagas_path
  end
end