class LoginController < ApplicationController
  def login
    username = params[:username]
    password = params[:password]

    user = User.find(:first, :conditions => {:username => username})

    if user && user.password == User.cleartext_to_digest(user.username, password)
      redirect_to :controller => 'portal'
    else
      flash[:notice] = "Wrong username or password."
      redirect_to :controller => 'login'
    end
  end
end