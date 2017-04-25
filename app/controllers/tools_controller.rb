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
      redirect_to @tool
    else
      render :new
    end
  end

  def index
    @tools = Tool.all
    if @tool == nil
      @tool = @tools
    else
      unless params[:tool][:name].empty?
       @tools = @tools.where("name ilike ?", params[:tool][:name])
      end
      unless params[:tool][:location].empty?
        @tools = @tools.where("location ilike ?", params[:tool][:location])
      end
      unless params[:tool][:category].empty?
        @tools = @tools.where("category ilike ?", params[:tool][:category])
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
