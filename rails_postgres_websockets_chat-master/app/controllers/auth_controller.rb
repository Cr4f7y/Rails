class AuthController < ChatController
  def index

  end

  def log_inHandler
    email=params['email']
    password=params['passwd']
    cl=Client.where(:email => email, :password =>password).first

    if(cl==nil)
      redirect_to :action => 'index'
    else
      session[:isLogin]=true
      session[:clientName]=cl.name
      redirect_to :controller => 'chat' , :action => 'index'
    end

  end

  def registrationHandler
    name=params['name']
    login=params['email']
    password=params['passwd']
    newClient=Client.new
    newClient.name=name
    newClient.email=login
    newClient.password=password
    newClient.save()
    log_inHandler
  end
end