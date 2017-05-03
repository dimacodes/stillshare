class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.password == @user.password_confirmation
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      flash[:success] = "Welcome to Stillshare!"
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @events = @user.events
    # @user.created_events
    respond_to do |f|
      f.html { render :show }
      f.json { render json: @user, adapter: :json }
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Your profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user
		@user = User.find_by(id: params[:id])
	end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
