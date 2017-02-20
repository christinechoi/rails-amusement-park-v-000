class UsersController < ApplicationController
  # before_action :logged_in_user, only: [:edit, :update]
  # before_action :correct_user, only: [:edit, :update]

  before_filter :authorize, only: [:edit, :update]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # binding.pry
    if @user
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to action: "show"
    end
  end

  def show
    # binding.pry
    if current_user.nil?
      redirect_to '/'
    else

    @user = User.find(params[:id])
    end
  end

  def update
  end

  def destroy
  end


  private

  def user_params
    params.require(:user).permit(:name, :happiness, :nausea, :height, :tickets, :password)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "You must be logged in to do that."
      redirect_to root_path
    end
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id    
  end

end
