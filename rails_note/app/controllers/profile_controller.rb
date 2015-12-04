class ProfileController < ApplicationController
  def profile
      @client = Client.find_by(email: session[:email])
  end

  def edit
    cl=Client.find_by(email: session[:email])
    if cl
      name=params['name']
      lastname=params['lastname']
      phone=params['phone']
      birthdate=params['birthdate']
      cl.name=name
      cl.lastname=lastname
      cl.phone=phone
      cl.birthdate=birthdate
      cl.save
      redirect_to :action => 'profile'
    end
  end
end
