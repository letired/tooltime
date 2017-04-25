class UsersController < ApplicationController
  def bookings
    if user_signed_in?
      if current_user.id == params[:id].to_i
        @bookings = Booking.where(user_id: params[:id])
      else
        redirect_to bookings_user_path(current_user)
      end
    else
      redirect_to new_user_session_path
    end
  end

  def tools
    if user_signed_in?
      if current_user.id == params[:id].to_i
        @tools = Tool.where(user_id: params[:id])
      else
        redirect_to tools_user_path(current_user)
      end
    else
      redirect_to new_user_session_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
