class AttractionsController < ApplicationController
  before_filter :authorize, only: [:edit, :update]

  before_action :require_login

  def new
    @attraction = Attraction.new 
  end

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def create
    @attraction = Attraction.new(attraction_params)

    if @attraction.save
      # binding.pry
      redirect_to attraction_path(@attraction)
    else
      render 'new'
    end

  end

  def edit
     @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update 
    redirect_to attractions_path
  end


  private
 
  def require_login
    return head(:forbidden) unless session.include? :user_id    
  end

  def attraction_params
    params.require(:attraction).permit(:min_height, :name, :tickets, :happiness_rating, :nausea_rating)
  end
  
end
