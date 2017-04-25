class ToolsController < ApplicationController
  def new
  end

  def create
  end

  def index
    @tools = Tool.all
    if params[:tool]
    @tools = Tool.where(
      name: params[:tool][:name],
      location: params[:tool][:location],
      category: params[:tool][:category]
      ).order(created_at: :desc)
    else
      @tools = Tool.all
    end
  end

  def show
    @tool = Tool.find(params[:id])
    # @owner = @tool.user_id.first_name # + " " + @tool.user_id.last_name
  end
end
