require "test_helper"

class CandidaturasControllerTest < ActionDispatch::IntegrationTest
  def setup
    Candidatura.delete_all
    Vaga.delete_all
    Candidato.delete_all
    Empregador.delete_all

    @empregador = Empregador.create(nome: "Empresa XYZ", email: "contato@empresa.xyz")
    @candidato = Candidato.create(nome: "Teste", email: "teste@example.com", telefone: "123456789")
    @vaga = Vaga.create(title: "Desenvolvedor", description: "Vaga para desenvolvedor", empregador: @empregador)
    @candidatura = Candidatura.create(candidato: @candidato, vaga: @vaga)
  end

  test "should create candidatura" do
    assert_difference('Candidatura.count', 1) do
      post candidaturas_url, params: { candidatura: { candidato_id: @candidato.id, vaga_id: @vaga.id } }
    end
    assert_redirected_to candidatura_url(Candidatura.last)
  end

  test "should get edit" do
    get edit_candidatura_url(@candidatura)
    assert_response :success
  end

  test "should update candidatura" do
    patch candidatura_url(@candidatura), params: { candidatura: { candidato_id: @candidato.id, vaga_id: @vaga.id } }
    assert_redirected_to candidatura_url(@candidatura)
  end

  test "should destroy candidatura" do
    assert_difference('Candidatura.count', -1) do
      delete candidatura_url(@candidatura)
    end
    assert_redirected_to candidaturas_url
  end

  test "should list all candidaturas" do
    get candidaturas_url
    assert_response :success
  end
end