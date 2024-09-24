# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
    def new
      # Renderiza a página de login
    end
  
    def create
      login = params[:session][:login]       # Acessa o parâmetro login dentro de session
      password = params[:session][:password] # Acessa o parâmetro password dentro de session
  
      user = Usuario.find_by(email: login) || Usuario.find_by(username: login)
  
      if user && user.authenticate(password)
        session[:user_id] = user.id
        flash[:success] = "Login bem-sucedido!"
        redirect_to root_path
      else
        flash[:danger] = "Email/Usuário ou senha inválidos"
        render :new
      end
    end
  
    def destroy
      session.delete(:user_id)
      flash[:success] = "Você saiu com sucesso."
      redirect_to new_session_path
    end
  end  