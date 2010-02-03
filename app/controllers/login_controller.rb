class LoginController < ApplicationController
  def login
    logger.info @parameters.inspect

    redirect_to :controller => 'portal'
  end
end
