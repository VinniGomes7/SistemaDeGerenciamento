class UsuariosController < ApplicationController
    def index
      @usuarios = Usuario.all
    end
  
    def show
      @usuario = Usuario.find(params[:id])
    end
  
    def new
      @usuario = Usuario.new
    end
  
    def create
      @usuario = Usuario.new(usuario_params)
      if @usuario.save
        redirect_to @usuario, notice: 'Conta criada com sucesso.'
      else
        render :new
      end
    end
  
    def edit
      @usuario = Usuario.find(params[:id])
    end
  
    def update
      @usuario = Usuario.find(params[:id])
      if @usuario.update(usuario_params)
        redirect_to @usuario, notice: 'Conta atualizada com sucesso.'
      else
        render :edit
      end
    end
  
    def destroy
      @usuario = Usuario.find(params[:id])
      @usuario.destroy
      redirect_to usuarios_path, notice: 'Conta removida com sucesso.'
    end
  
    private
  
    def usuario_params
      params.require(:usuario).permit(:username, :email, :password)
    end
  end
  