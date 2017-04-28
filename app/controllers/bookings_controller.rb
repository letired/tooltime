class BookingsController < ApplicationController
  before_action :set_booking, only: [ :show, :update_state ]
  before_action :authenticate_user!

  def show
    if current_user.id == @booking.tool.user.id
      @message = Message.new
    elsif current_user.id == @booking.user.id
      @message = Message.new
    else
      redirect_to root_path
    end
  end

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


  def update_state
    @booking.accepted = true if params[:state_change] == "accept"
    @booking.accepted = false if params[:state_change] == "reject"
    @booking.save
  end

  private

  def booking_create_params
    params.require(:booking).permit(:message, :date_begin, :date_end)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
