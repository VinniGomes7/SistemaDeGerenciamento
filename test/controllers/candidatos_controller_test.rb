require "test_helper"

class CandidatosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @candidato = Candidato.create(nome: "Teste", email: "teste@example.com")
  end

  test "should get index" do
    get candidatos_url
    assert_response :success
    assert_select "h1", "Candidatos"
  end

  test "should get new" do
    get new_candidato_url
    assert_response :success
    assert_select "h1", "Novo Candidato"
  end

  test "should create candidato" do
    assert_difference("Candidato.count") do
      post candidatos_url, params: { candidato: { nome: "Novo", email: "novo@example.com" } }
    end
    assert_redirected_to candidato_path(Candidato.last)
  end

  test "should show candidato" do
    get candidato_url(@candidato)
    assert_response :success
    assert_select "h1", @candidato.nome
  end

  test "should get edit" do
    get edit_candidato_url(@candidato)
    assert_response :success
    assert_select "h1", "Editar Candidato"
  end

  test "should update candidato" do
    patch candidato_url(@candidato), params: { candidato: { nome: "Atualizado", email: "atualizado@example.com" } }
    assert_redirected_to candidato_path(@candidato)
    @candidato.reload
    assert_equal "Atualizado", @candidato.nome
  end

  test "should destroy candidato" do
    assert_difference("Candidato.count", -1) do
      delete candidato_url(@candidato)
    end
    assert_redirected_to candidatos_path
  end
end