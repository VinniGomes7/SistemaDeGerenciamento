module SessionsHelper
    # Faz login no usuário
    def log_in(usuario)
      session[:usuario_id] = usuario.id
    end
  
    # Retorna o usuário logado, se houver
    def current_usuario
      @current_usuario ||= Usuario.find_by(id: session[:usuario_id])
    end
  
    # Verifica se há um usuário logado
    def logged_in?
      !current_usuario.nil?
    end
  
    # Faz logout do usuário
    def log_out
      session.delete(:usuario_id)
      @current_usuario = nil
    end
  end  