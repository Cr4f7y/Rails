class AuthController < ChatController
  def index
  end

  def log_inHandler
    email=params['email']
    password=params['passwd']
    cl=Client.find_by(email: email)
    if password==cl.password
      session[:isLogin]=true
      session[:clientName]=cl.name
      session[:email]=email
      redirect_to :controller => 'chat' , :action => 'index'
      else
        flash[:danger] = "Invalid Email or Password"
        redirect_to :action => 'index'
    end

  end

  def registrationHandler
    email=params['email']
    cl=Client.find_by(email: email)
      if !cl
        name=params['name']
        password=params['passwd']
        lastname=params['last_name']
        phone=params['phone']
        birthdate=params['birthdate']
        newClient=Client.new
        newClient.name=name
        newClient.password = password
        newClient.email=email
        newClient.lastname=lastname
        newClient.phone=phone
        newClient.birthdate=birthdate
        newClient.save()
        log_inHandler
      else
        flash[:danger] = "Email is already in use."
        redirect_to :action => 'index'
      end
  end
end