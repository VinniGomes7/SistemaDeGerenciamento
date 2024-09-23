class EmpregadoresController < ApplicationController
  def index
    @empregadores = Empregador.all
  end

  def show
    @empregador = Empregador.find(params[:id])
  end

  def new
    @empregador = Empregador.new
  end

  def create
    @empregador = Empregador.new(empregador_params)
    if @empregador.save
      redirect_to empregadore_url(@empregador), notice: 'Empregador criado com sucesso.' # Corrigido
    else
      render :new
    end
  end

  def edit
    @empregador = Empregador.find(params[:id])
  end

  def update
    @empregador = Empregador.find(params[:id])
    if @empregador.update(empregador_params)
      redirect_to empregadore_url(@empregador), notice: 'Empregador atualizado com sucesso.' # Corrigido
    else
      render :edit
    end
  end

  def destroy
    @empregador = Empregador.find(params[:id])
    @empregador.destroy
    redirect_to empregadores_path, notice: 'Empregador removido com sucesso.'
  end

  private

  def empregador_params
    params.require(:empregador).permit(:nome, :email)
  end
end