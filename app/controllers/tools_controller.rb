class ToolsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show ]
  before_action :authenticate_user!, only: [:new]
  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_create_params)
    @user = User.find(params[:user_id])
    @tool.user = @user
    if @tool.save
      redirect_to tools_user_path(@user)
    else
      render :new
    end
  end

  def index
    @tools = Tool.all
    if params[:tool] == nil
      @tools
    else
      unless params[:tool][:name].empty?
       @tools = @tools.where("name ilike ? AND user_id != ?", "%#{params[:tool][:name].strip}%", user_signed_in? ? current_user.id : 0)
      end
      unless params[:tool][:location].empty?
        @tools = @tools.where("location ilike ? AND user_id != ?", params[:tool][:location], user_signed_in? ? current_user.id : 0)
      end
      unless params[:tool][:category].empty?
        @tools = @tools.where("category ilike ? AND user_id != ?", params[:tool][:category], user_signed_in? ? current_user.id : 0)
      end
    end
  end

  def show
    @tool = Tool.find(params[:id])
    @booking = Booking.new
  end

  private

  def tool_create_params
    params.require(:tool).permit(:name, :category, :location, :description, :user_id, :photo)
  end
end
