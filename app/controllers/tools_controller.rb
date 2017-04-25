class ToolsController < ApplicationController
  def new
  end

  def create
  end

  def index
  end

  def show
    @tool = Tool.find(params[:id])
    @owner = @tool.owner_id.first_name + " " + @tool.owner_id.last_name
  end
end
