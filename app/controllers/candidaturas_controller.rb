class CandidaturasController < ApplicationController
    def index
      @candidaturas = Candidatura.all
    end
  
    def create
      @candidatura = Candidatura.new(candidatura_params)
      if @candidatura.save
        redirect_to @candidatura, notice: 'Candidatura realizada com sucesso.'
      else
        render :new
      end
    end
  
    private
  
    def candidatura_params
      params.require(:candidatura).permit(:candidato_id, :vaga_id)
    end
  end
  