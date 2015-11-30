class ChatController < ApplicationController
  def index
    if(session[:isLogin]!=true)
      redirect_to :controller => 'auth', :action => 'index'
    end

    @messages = Message.first(5).reverse
    @name = session[:clientName]
  end

  def reset
    reset_session
    redirect_to :controller => 'auth', :action => 'index'
  end

  def test

  end
end
