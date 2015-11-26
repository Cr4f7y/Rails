class ChatController < ApplicationController
  def index
    if(session[:isLogin]!=true)
      redirect_to :controller => 'auth', :action => 'index'
    end

    @messages = Message.first(5)
    @name = session[:clientName]
  end

  def reset
    reset_session
    redirect_to :controller => 'auth', :action => 'index'
  end
end
