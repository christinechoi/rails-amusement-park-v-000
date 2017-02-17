class Ride < ActiveRecord::Base

  belongs_to :user
  belongs_to :attraction




  def take_ride
    @ride = Attraction.find_by(:id => self.attraction_id)
    @user = User.find_by(:id => self.user_id)
    # binding.pry
    if @user.height >= @ride.min_height && @user.tickets >= @ride.tickets 
      # binding.pry
      @user.tickets = @user.tickets - @ride.tickets
      @user.happiness = @user.happiness + @ride.happiness_rating 
      @user.nausea = @user.nausea + @ride.nausea_rating
      @user.save
    elsif @user.tickets < @ride.tickets && @user.height < @ride.min_height
      "Sorry. You do not have enough tickets the #{@ride.name}. You are not tall enough to ride the #{@ride.name}."
    elsif @user.tickets < @ride.tickets
      "Sorry. You do not have enough tickets the #{@ride.name}."
    elsif @user.height < @ride.min_height
      "Sorry. You are not tall enough to ride the #{@ride.name}."
    end
    

  end

end
