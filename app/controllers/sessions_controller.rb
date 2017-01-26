class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if auth
      @user = User.from_omniauth(auth)
      @user.name = auth['info']['name']
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Welcome #{@user.name}!"
    else
      @user = User.find_by(email: params[:user][:email])

      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user), notice: "Welcome #{@user.name}!"
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    end
  end
  #   user = User.find_by(email: params[:user][:email])
  #   return head(:forbidden) unless user.authenticate(params[:user][:password])
  #   session[:user_id] = user.id
  #   redirect_to user_path(user)
  # end

  def destroy
    logout
    redirect_to '/', notice: "Signed out"
  end

  def auth
    request.env['omniauth.auth']
  end
end
