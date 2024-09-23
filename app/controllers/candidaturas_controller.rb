class CandidaturasController < ApplicationController
  def index
    @candidaturas = Candidatura.all
  end

  def show
    @candidatura = Candidatura.find(params[:id])
  end

  def new
    @candidatura = Candidatura.new
  end

  def create
    @candidatura = Candidatura.new(candidatura_params)
    if @candidatura.save
      redirect_to @candidatura, notice: 'Candidatura criada com sucesso.'
    else
      render :new
    end
  end

  def edit
    @candidatura = Candidatura.find(params[:id])
  end

  def update
    @candidatura = Candidatura.find(params[:id])
    if @candidatura.update(candidatura_params)
      redirect_to @candidatura, notice: 'Candidatura atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @candidatura = Candidatura.find(params[:id])
    @candidatura.destroy
    redirect_to candidaturas_path, notice: 'Candidatura removida com sucesso.'
  end

  private

  def candidatura_params
    params.require(:candidatura).permit(:candidato_id, :vaga_id)
  end
end