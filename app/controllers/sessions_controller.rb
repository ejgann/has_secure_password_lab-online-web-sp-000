class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(name: params[:user][:name]).try(:authenticate, params[:user][:password])

        if user
            session[:user_id] = user.id
        else
            redirect_to(controller: 'sessions', action: 'new')
        end
    end

    def destroy
        session.delete(:user_id)
    end


end
