class MessagesController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @user = User.find(params[:user_id])
    @message = Message.new(message_create_params)
    @message.user = @user
    @message.booking = @booking
    if @message.save
      respond_to do |format|
        format.html { redirect_to @booking }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'booking/show' }
        format.js  # <-- idem
      end
    end
  end

  private

  def message_create_params
    params.require(:message).permit(:content, :user_id, :booking_id)
  end
end
