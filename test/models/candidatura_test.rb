require "test_helper"

class CandidaturaTest < ActiveSupport::TestCase
  def setup
    Candidatura.delete_all
    Vaga.delete_all
    Candidato.delete_all
    Empregador.delete_all

    @empregador = Empregador.create(nome: "Empresa XYZ", email: "contato@empresa.xyz")
    @candidato = Candidato.create(nome: "Teste", email: "teste@example.com", telefone: "123456789")
    @vaga = Vaga.create(titulo: "Desenvolvedor", descricao: "Vaga para desenvolvedor", empregador: @empregador)
    @candidatura = Candidatura.create(candidato: @candidato, vaga: @vaga)
  end
  
  test "should save candidatura with valid attributes" do
    candidatura = Candidatura.new(candidato: @candidato, vaga: @vaga)
    assert candidatura.save, "Could not save the candidatura with valid attributes. Errors: #{candidatura.errors.full_messages.join(', ')}"
  end  
  
  test "should not save candidatura without candidato_id" do
    candidatura = Candidatura.new(vaga: @vaga)
    assert_not candidatura.save, "Saved the candidatura without a candidato_id"
  end

  test "should not save candidatura without vaga_id" do
    candidatura = Candidatura.new(candidato: @candidato)
    assert_not candidatura.save, "Saved the candidatura without a vaga_id"
  end

  test "should not save candidatura with non-existent candidato_id" do
    candidatura = Candidatura.new(candidato_id: 999, vaga: @vaga)
    assert_not candidatura.save, "Saved the candidatura with a non-existent candidato_id"
  end

  test "should not save candidatura with non-existent vaga_id" do
    candidatura = Candidatura.new(candidato: @candidato, vaga_id: 999)
    assert_not candidatura.save, "Saved the candidatura with a non-existent vaga_id"
  end
end