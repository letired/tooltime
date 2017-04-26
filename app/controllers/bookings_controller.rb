class BookingsController < ApplicationController

  def create
    @tool = Tool.find(params[:tool_id])
    @user = User.find(params[:user_id])

    @booking = Booking.new(booking_create_params)
    @booking.user = @user
    @booking.tool = @tool

    if @booking.save
      redirect_to bookings_user_path(current_user)
    else
      render "tools/show"
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_update_params)
    redirect_to tools_user_path(@booking.tool.user)
  end

  def update_state
    @booking = Booking.find(params[:booking_id])
    @booking.accepted = true if params[:value] == "accept"
    @booking.accepted = false if params[:value] == "reject"
    @booking.save
  end

  private

  def booking_create_params
    params.require(:booking).permit(:message, :date_begin, :date_end)
  end

  def booking_update_params
    params.require(:booking).permit(:accepted)
  end
end
