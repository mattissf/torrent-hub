require 'spec_helper'

describe User do
  it "should store password hashed for use in digest authentication" do
    #given
    username = 'Mattis'
    password = 'password'
    
    #when
    user = User.make(:password => password, :username => username)
    
    #then
    user.password.should == "54c102402f179323b1c73334b74d509e" 
  end
end