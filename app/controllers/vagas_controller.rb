class VagasController < ApplicationController
  def index
    @vagas = Vaga.all
  end

  def show
    @vaga = Vaga.find(params[:id])
  end

  def new
    @vaga = Vaga.new
  end

  def create
    @vaga = Vaga.new(vaga_params)
    if @vaga.save
      redirect_to @vaga, notice: 'Vaga criada com sucesso.'
    else
      render :new
    end
  end

  def edit
    @vaga = Vaga.find(params[:id])
  end

  def update
    @vaga = Vaga.find(params[:id])
    if @vaga.update(vaga_params)
      redirect_to @vaga, notice: 'Vaga atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @vaga = Vaga.find(params[:id])
    @vaga.destroy
    redirect_to vagas_path, notice: 'Vaga removida com sucesso.'
  end

  private

  def vaga_params
    params.require(:vaga).permit(:title, :description, :empregador_id)
  end
end
