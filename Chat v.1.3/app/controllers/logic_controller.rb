class LogicController < ApplicationController
  include ChatHelper
  def main
    if(session[:isLogin]!=true)
      redirect_to :controller => 'auth', :action => 'index'
    end
    getLastMess()
  end

   def massHandler
    if(session[:isLogin]!=true )
      redirect_to :controller => 'auth', :action => 'index'
    end
    clientMessage=params['message']
    clientName=session[:clientName]
    cl=Client.where(:name => clientName).first
    m=cl.messages.create(mess: clientMessage)
    m.save

    getLastMess()

    redirect_to :action => 'main'

   end

  def getLastMess
      q = Message.last(8)
      @answer=""
      @name = ""
      @messages_all = []

      j=0
      for q in q
        @name = q.client.name
        @answer = q['mess']
        @time = q['created_at']
        @messages_all[j] = chat(@name,@answer,@time)
        j=j+1
      end
    end
  end
