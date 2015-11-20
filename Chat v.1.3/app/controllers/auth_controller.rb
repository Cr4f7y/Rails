class AuthController < ApplicationController
  def index
  end

  def registration
  end
  def log_in
  end


  def log_inHandler
    login=params['login']
    password=params['passwd']
    cl=Client.where(:login => login, :password =>password).first
    if(cl==nil)
      redirect_to :action => 'index'
    else
      session[:isLogin]=true
      session[:clientName]=cl.name
      redirect_to :controller => 'logic', :action => 'main'
    end



  end

  def registrationHandler
    name=params['name']
    login=params['login']
    password=params['passwd']
    newClient=Client.new
    newClient.name=name
    newClient.login=login
    newClient.password=password
    newClient.save()
    redirect_to :action =>'index'

  end
end
