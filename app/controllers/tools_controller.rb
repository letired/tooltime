class ToolsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def new
  end

  def create

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
end
