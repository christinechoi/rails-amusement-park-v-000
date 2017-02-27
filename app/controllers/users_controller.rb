class UsersController < ApplicationController

  before_filter :authorize, only: [:edit, :update]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user
      @user.save
      session[:user_id] = @user.id
      # binding.pry
      redirect_to user_path(@user)

    else
      redirect_to user_path(@user)
    end
  end

  def show
    if current_user.nil?
      redirect_to '/'
    else
      # binding.pry
      @user = User.find(params[:id])
    end

  end

  def update
    
    @attraction = Attraction.find(params[:attraction_id])
    # binding.pry
    current_user.tickets = current_user.tickets - @attraction.tickets 
    current_user.nausea = current_user.nausea + @attraction.nausea_rating
    current_user.happiness = current_user.happiness - @attraction.happiness_rating 
    # binding.pry
    current_user.mood

    # = "sad" if current_user.nausea > current_user.happiness 

    current_user.save
    # binding.pry
    redirect_to user_path(current_user)


  end

  def destroy
  end


  private

  def user_params
    params.require(:user).permit(:name, :happiness, :nausea, :height, :tickets, :password)
  end

  # def correct_user
  #   @user = User.find(params[:id])
  #   redirect_to(root_url) unless current_user?(@user)
  # end

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
