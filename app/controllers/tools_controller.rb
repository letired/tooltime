class ToolsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show ]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    @tools = Tool.all
    if params[:tool] == nil
      @tools
    else
      unless params[:tool][:name].empty?
       @tools = @tools.where("name ilike ?", "%#{params[:tool][:name].strip}%")
      end
      unless params[:tool][:location].empty?
        @tools = @tools.where("location ilike ?", params[:tool][:location])
      end
      unless params[:tool][:category].empty?
        @tools = @tools.where("category ilike ?", params[:tool][:category])
      end
    end
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    @user = User.find(params[:user_id])
    @tool.user = @user
    if @tool.save
      redirect_to tools_user_path(@user)
    else
      render :new
    end
  end

  def show
    get_map_coords
    @tool = Tool.find(params[:id])
    @booking = Booking.new
  end

  def edit
    tool = Tool.find(params[:id])
    if current_user.id == tool.user_id
      @tool = tool
    else
      redirect_to tools_user_path(current_user), notice: 'You are not authorized to perform this action.'
    end
  end

  def update
    @tool = Tool.find(params[:id])
    @user = User.find(params[:user_id])
    if @tool.update(tool_params)
      redirect_to tools_user_path(@user), notice: 'Tool was updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy
    redirect_to tools_user_path, notice: 'Tool was deleted successfully.'
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :category, :location, :description, :user_id, :photo)
  end

  def get_map_coords
    @tools = Tool.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@tools) do |tool, marker|
      marker.lat tool.latitude
      marker.lng tool.longitude
      # marker.infowindow render_to_string(partial: "/tools/map_box", locals: { flat: flat })
    end
  end
end
