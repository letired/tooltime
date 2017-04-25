class ToolsController < ApplicationController
  def new
  end

  def create
  end

  def index
    @tools = Tool.all
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

  def show
  end
end
