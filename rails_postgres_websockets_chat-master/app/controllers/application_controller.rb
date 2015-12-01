class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # skip_before_filter :verify_authenticity_token
  #<%= debug(params) if Rails.env.development? %>
  layout :another_by_method
  private
  def another_by_method
    if session[:isLogin].nil?
      "layouts/application"
    else
      "layouts/default"
    end
  end
end
