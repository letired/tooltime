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
    @booking = Booking.find(params[:id])
    @booking.update(booking_update_params)
    redirect_to tools_user_path(@booking.tool.user)
  end

  private

  def booking_create_params
    params.require(:booking).permit(:tool_id, :user_id, :message, :date_begin, :date_end)
  end

  def booking_update_params
    params.require(:booking).permit(:accepted)
  end
end
