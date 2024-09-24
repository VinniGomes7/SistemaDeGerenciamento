require "test_helper"

class EmpregadoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empregador = Empregador.create(nome: "Empresa XYZ", email: "empregador@example.com")
  end

  test "should get index" do
    get empregadores_url
    assert_response :success
  end

  test "should create empregador" do
    assert_difference('Empregador.count', 1) do
      post empregadores_url, params: { empregador: { nome: "Novo Empregador", email: "novo@empresa.com" } }
    end
    assert_redirected_to empregadore_url(Empregador.last)
  end

  test "should show empregador" do
    get empregadore_url(@empregador)
    assert_response :success
  end

  test "should update empregador" do
    patch empregadore_url(@empregador), params: { empregador: { nome: "Atualizado", email: "atualizado@empresa.com" } }
    assert_redirected_to empregadore_url(@empregador)
  end

  test "should destroy empregador" do
    assert_difference('Empregador.count', -1) do
      delete empregadore_url(@empregador)
    end
    assert_redirected_to empregadores_url
  end
end