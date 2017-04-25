class BookingsController < ApplicationController

  def create
    @tool = Tool.find(params[:tool_id])
    @booking = Booking.new(booking_create_params)
    @booking.tool = @tool
    if @booking.save
      redirect_to tool_path(@tool)
    else
      render "tools/show"
    end
  end

  def update

  end

  private

  def booking_create_params
    params.require(:booking).permit(:user_id, :message, :date_begin, :date_end)
  end

end
