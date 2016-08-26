class UserController < ApplicationController

  def index

  end

  def register
    #  !params[:name].nil? && !params[:name].strip.empty? && !params[:address].nil? && !params[:address].strip.empty? && !params[:city].nil? && !params[:city].strip.empty? && !params[:state].nil? && !params[:state].strip.empty? && !params[:postal].nil? && !params[:postal].strip.empty? && !params[:country].nil? && !params[:country].strip.empty? && !params[:email].nil? && !params[:email].strip.empty? &&

    if !params[:userid].nil? &&     !params[:userid].strip.empty? && !params[:password].nil? && !params[:password].strip.empty? && params[:userid] != session[:userid]
      @user = User.new(params[:name], params[:address], params[:city], params[:state], params[:postal], params[:country], params[:email], params[:userid], params[:password])
      session[:userid] = @user.userid
      cookies[:user] = @user.to_yaml
      flash[:notice] = "Registration Confirmed!"
      render 'login.html.erb'
    elsif params[:userid] == session[:userid]
      flash[:alert] = "User ID taken, try another."
      redirect_to "/"
    else
      flash[:alert] = "Please enter a user id and password."
      redirect_to "/"

    end
  end

  def login
    @user = YAML.load(cookies[:user])
    if !params[:userid].nil? &&     !params[:userid].strip.empty? && !params[:password].nil? && !params[:password].strip.empty? && params[:userid] == @user.userid && params[:password]== @user.password
      if @user.email == ""
        @user.email = "No Email"
        cookies[:user] = @user.to_yaml
      end
      render 'info.html.erb'
    else
      flash[:notice] = "Login failed try again."
      render 'login.html.erb'
    end
  end

  def info
  end

  def logout
    cookies[:user] = ""
    flash[:notice] = "You have been logged out successfully."
    render 'login.html.erb'
  end


end
