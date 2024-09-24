require "test_helper"

class CandidatosControllerTest < ActionDispatch::IntegrationTest
  def setup
    @usuario = Usuario.create(nome: "Teste", email: "teste@example.com", username: "testuser", password: "password")
    @candidato = Candidato.create(nome: "Teste", email: "teste@example.com")
    
    # Simula o login do usuário
    post login_path, params: { session: { login: @usuario.email, password: 'password' } }
  end

  test "should get index" do
    get candidatos_path
    assert_response :success
    assert_select "h1", "Candidatos"
  end

  test "should get new" do
    get new_candidato_path
    assert_response :success
    assert_select "h1", "Novo Candidato"
  end

  test "should create candidato" do
    assert_difference("Candidato.count") do
      post candidatos_path, params: { candidato: { nome: "Novo", email: "novo@example.com" } }
    end
    assert_redirected_to candidato_path(Candidato.last)
  end

  test "should show candidato" do
    get candidato_path(@candidato)
    assert_response :success
    assert_select "h1", @candidato.nome
  end

  test "should get edit" do
    get edit_candidato_path(@candidato)
    assert_response :success
    assert_select "h1", "Editar Candidato"
  end

  test "should update candidato" do
    patch candidato_path(@candidato), params: { candidato: { nome: "Atualizado", email: "atualizado@example.com" } }
    assert_redirected_to candidato_path(@candidato)
    @candidato.reload
    assert_equal "Atualizado", @candidato.nome
  end

  test "should destroy candidato" do
    assert_difference("Candidato.count", -1) do
      delete candidato_path(@candidato)
    end
    assert_redirected_to candidatos_path
  end
end