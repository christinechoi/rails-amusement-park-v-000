class AttractionsController < ApplicationController
  before_action :require_login

  def new
  end

  def index
  end

  def show
    
  end

  def create
  end

  def update
  end


  private
 
  def require_login
    return head(:forbidden) unless session.include? :user_id    
  end
  
end
