class UsersController < ApplicationController
  before_action :authenticate_user!

  def bookings
    if current_user.id == params[:id].to_i
      @bookings = Booking.where(user_id: params[:id])
    else
      redirect_to bookings_user_path(current_user)
    end
  end

  def tools
    if current_user.id == params[:id].to_i
      @tools = Tool.where(user_id: params[:id])
    else
      redirect_to tools_user_path(current_user)
    end
  end
end
