class AuthController < ChatController
  def index
  end

  def log_inHandler
    email=params['email']
    password=params['passwd']
    cl=Client.find_by(email: email)
    current_user = cl.authenticate(password)
    if !current_user
      flash[:danger] = "Invalid Username or Password"
      redirect_to :action => 'index'
    else
      session[:isLogin]=true
      session[:clientName]=current_user.name
      redirect_to :controller => 'chat' , :action => 'index'
    end

  end

  def registrationHandler
    email=params['email']
    cl=Client.find_by(email: email)
      if !cl
        name=params['name']
        password=params['passwd']
        newClient=Client.new
        newClient.name=name
        newClient.password = password
        newClient.email=email
        newClient.save()
        log_inHandler
      else
        flash[:danger] = "Email is already in use."
        redirect_to :action => 'index'
      end
  end
end