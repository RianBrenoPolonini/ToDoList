module SessionsHelper
    # Cria a session com o id do usuario
    def sign_in(user)
        session[:user_id] = user.id
    end

    # Apaga a session com o id do usuario
    def sign_out
        session.delete(:user_id)
        @current_user = nil
    end
    
    # Verifica se o User está logado e pega as info dele
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    # Redireciona User logado para a pagina dele
    def block_access
        if current_user.present?
            redirect_to users_path
        end
    end

    # Vericica se tem algum usuario logado
    def user_signed_in?
        !current_user.nil?
    end

    # Se não tiver nenhum usuario logado, redireciona para o root
    def authorize
        unless user_signed_in?
            flash[:danger] = 'Acesso negado!'
            redirect_to root_url
        end
    end
end
