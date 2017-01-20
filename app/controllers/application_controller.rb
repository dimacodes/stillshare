class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
  end

  private

  def current_user
    @user ||= User.find_by(id: session[:user_id])
    # if @user
    #   @user
    # else
    #   User.find_by(id: session[:user_id])
    # end
  end
end
