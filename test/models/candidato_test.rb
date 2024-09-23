require "test_helper"

class CandidatoTest < ActiveSupport::TestCase
  def setup
    Candidatura.delete_all # Deletar as candidaturas relacionadas
    Candidato.delete_all # Deletar os candidatos
  end

  test "should not save candidato without nome" do
    candidato = Candidato.new(email: "teste@example.com")
    assert_not candidato.save, "Saved the candidato without a nome"
  end

  test "should not save candidato without email" do
    candidato = Candidato.new(nome: "Teste")
    assert_not candidato.save, "Saved the candidato without an email"
  end

  test "should not save candidato with invalid email" do
    candidato = Candidato.new(nome: "Teste", email: "invalid_email")
    assert_not candidato.save, "Saved the candidato with an invalid email"
  end

  test "should save candidato with valid attributes" do
    candidato = Candidato.new(nome: "Teste", email: "teste@example.com")
    assert candidato.save, "Could not save the candidato with valid attributes"
  end

  test "should have a unique email" do
    Candidato.create(nome: "Teste", email: "teste@example.com")
    candidato = Candidato.new(nome: "Outro", email: "teste@example.com")
    assert_not candidato.save, "Saved the candidato with a duplicate email"
  end
end