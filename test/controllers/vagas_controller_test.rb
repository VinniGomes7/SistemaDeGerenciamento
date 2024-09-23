require "test_helper"

class VagasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empregador = Empregador.create(nome: "Empresa XYZ", email: "empregador@example.com")
    @vaga = Vaga.create(titulo: "Desenvolvedor", descricao: "Descrição da vaga", empregador: @empregador)
  end
  
  test "should list all vagas" do
    get vagas_url
    assert_response :success
    assert_select "h1", "Vagas"
  end

  test "should create vaga" do
    assert_difference("Vaga.count") do
      post vagas_url, params: { vaga: { titulo: "Nova Vaga", descricao: "Descrição da nova vaga", empregador_id: @empregador.id } }
    end
    assert_redirected_to vaga_path(Vaga.last)
  end

  test "should show vaga" do
    get vaga_url(@vaga)
    assert_response :success
  end

  test "should update vaga" do
    patch vaga_url(@vaga), params: { vaga: { titulo: "Atualizado" } }
    assert_redirected_to vaga_path(@vaga)
    @vaga.reload
    assert_equal "Atualizado", @vaga.titulo
  end

  test "should destroy vaga" do
    assert_difference("Vaga.count", -1) do
      delete vaga_url(@vaga)
    end
    assert_redirected_to vagas_path
  end
end